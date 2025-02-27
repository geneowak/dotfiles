-- Language Server Protocol

return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
  },
  config = function()
    -- Setup Mason to automatically install LSP servers
    require("mason").setup({
      ui = {
        height = 0.8,
      },
    })
    require("mason-lspconfig").setup({ automatic_installation = true })

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local lspconfig = require("lspconfig")
    -- PHP
    lspconfig.intelephense.setup({
      commands = {
        IntelephenseIndex = {
          function()
            vim.lsp.buf.execute_command({ command = "intelephense.index.workspace" })
          end,
        },
      },
      on_attach = function(client, bufnr)
        -- client.server_capabilities.documentFormattingProvider = false
        -- client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
      end,
      capabilities = capabilities,
    })

    -- Vue, JavaScript, TypeScript
    lspconfig.volar.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
      end,
      capabilities = capabilities,
      -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
      -- This drastically improves the responsiveness of diagnostic updates on change
      -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })

    local mason_registry = require("mason-registry")
    local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
        .. "/node_modules/@vue/language-server"

    -- TypeScript
    lspconfig.ts_ls.setup({
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "javascript", "typescript", "vue" },
          },
        },
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
      },
    })

    -- Python
    lspconfig.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pyflakes = { enabled = false },
            pycodestyle = { enabled = false },
            autopep8 = { enabled = false },
            yapf = { enabled = false },
            mccabe = { enabled = false },
            pylsp_mypy = { enabled = false },
            pylsp_black = { enabled = false },
            pylsp_isort = { enabled = false },
          },
        },
      },
    })

    -- Tailwind CSS
    lspconfig.tailwindcss.setup({ capabilities = capabilities })

    -- JSON
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
        },
      },
    })

    -- Lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = {
              "${3rd}/luv/library",
              unpack(vim.api.nvim_get_runtime_file("", true)),
            },
          },
        },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
    vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
    vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
    vim.keymap.set("n", "<Leader>lr", ":LspRestart<CR>", { silent = true })
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

    -- Commands
    vim.api.nvim_create_user_command("Format", function()
      vim.lsp.buf.format({ timeout_ms = 5000 })
    end, {})

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
      },
    })

    -- Sign configuration
    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
  end,
}

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

    local lsp_flags = {
      allow_incremental_sync = true,
      debounce_text_changes = 150,
    }

    -- Emmet
    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- Go
    vim.lsp.config("gopls", {
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- PHP
    vim.lsp.config("intelephense", {
      commands = {
        IntelephenseIndex = {
          function()
            local clients = vim.lsp.get_clients({ name = "intelephense" })
            if clients[1] then
              clients[1]:exec_cmd({ command = "intelephense.index.workspace" })
            end
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
    vim.lsp.config("vue_ls", {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
      end,
      capabilities = capabilities,
    })

    local mason_registry = require("mason-registry")
    local vue_language_server_path =
        vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server")

    -- TypeScript
    vim.lsp.config("ts_ls", {
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
    vim.lsp.config("pylsp", {
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
    vim.lsp.config("tailwindcss", { capabilities = capabilities })

    -- JSON
    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
        },
      },
    })

    -- Lua
    vim.lsp.config("lua_ls", {
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

    -- Enable all configured LSP servers
    vim.lsp.enable({
      "emmet_ls",
      "gopls",
      "intelephense",
      "vue_ls",
      "ts_ls",
      "pylsp",
      "tailwindcss",
      "jsonls",
      "lua_ls",
    })

    -- Keymaps
    vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<CR>")
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<CR>")
    vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
    vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
    vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
    vim.keymap.set("n", "<Leader>lr", ":LspRestart<CR>", { silent = true })
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
        border = { " ", " ", " ", " ", " ", " ", " ", " " },
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
    })
  end,
}

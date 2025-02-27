-- Format on save and linters
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
  },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
        "shfmt",
        "ruff",
      },
      automatic_installation = true,
    })

    local sources = {
      require("none-ls.formatting.ruff").with({
        extra_args = { "--extend-select", "I" },
      }),
      formatting.shfmt.with({ args = { "-i", "4" } }),
      formatting.stylua,
      formatting.terraform_fmt,
      require("none-ls.diagnostics.eslint_d"), -- requires none-ls-extras.nvim
      -- null_ls.builtins.diagnostics.phpstan, -- TODO: Only if config file
      diagnostics.trail_space.with({ disabled_filetypes = { "NvimTree" } }),
      formatting.pint.with({
        condition = function(utils)
          return utils.root_has_file({ "vendor/bin/pint" })
        end,
      }),
      formatting.prettier.with({
        -- condition = function(utils)
        --   return utils.root_has_file({ '.prettierrc', '.prettierrc.json', '.prettierrc.yml', '.prettierrc.js',
        --     'prettier.config.js' })
        -- end,
      }),
    }

    null_ls.setup({
      temp_dir = "/tmp",
      sources = sources,
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}

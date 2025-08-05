--- Laravel Nvim
return {
  "adalessa/laravel.nvim",
  enabled = false,
  dependencies = {
    "tpope/vim-dotenv",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel" },
  keys = {
    { "<leader>La", ":Laravel artisan<cr>" },
    { "<leader>Lr", ":Laravel routes<cr>" },
    { "<leader>Lm", ":Laravel related<cr>" },
  },
  event = { "VeryLazy" },
  opts = {
    lsp_server = "phpactor",
    features = {
      route_info = {
        enable = true,
        view = "top",
      },
      model_info = {
        enable = true,
      },
      override = {
        enable = true,
      },
      pickers = {
        enable = true,
        provider = 'telescope',
      },
    },
    -- ui = require("laravel.options.ui"),
    -- commands_options = require("laravel.options.command_options"),
    -- environments = require("laravel.options.environments"),
    -- user_commands = require("laravel.options.user_commands"),
    -- resources = require("laravel.options.resources"),
    -- providers = {
    --   require("laravel.providers.laravel_provider"),
    --   require("laravel.providers.repositories_provider"),
    --   require("laravel.providers.override_provider"),
    --   require("laravel.providers.completion_provider"),
    --   require("laravel.providers.route_info_provider"),
    --   require("laravel.providers.tinker_provider"),
    --   require("laravel.providers.telescope_provider"),
    --   require("laravel.providers.fzf_lua_provider"),
    --   require("laravel.providers.ui_select_provider"),
    --   require("laravel.providers.user_command_provider"),
    --   require("laravel.providers.status_provider"),
    --   require("laravel.providers.diagnostics_provider"),
    --   require("laravel.providers.model_info_provider"),
    --   require("laravel.providers.composer_info_provider"),
    --   require("laravel.providers.history_provider"),
    -- },
    user_providers = {}, -- Custom providers, see below
  },
  config = true,
}

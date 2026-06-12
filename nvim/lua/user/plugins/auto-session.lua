-- auto session management
return {
  "rmagatti/auto-session",
  lazy = false,
  enabled = true,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { "<leader>sL", "<cmd>AutoSession search<CR>", desc = "Session search" },
    { "<leader>sS", "<cmd>AutoSession save<CR>", desc = "Save session" },
    { "<leader>sT", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
  },
  config = function()
    require("auto-session").setup({
      enabled = true,
      auto_save = true,
      auto_restore = true,
      auto_restore_last_session = false,
      log_level = "error",
      -- allowed_dirs = { "~/Code/**/*" },
    })
  end,
}

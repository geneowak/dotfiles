-- auto session management
return {
  "rmagatti/auto-session",
  lazy = false,
  enabled = false,
  config = function()
    require("auto-session").setup({
      enabled = true,
      auto_save = true,
      auto_restore = true,
      auto_restore_last_session = false,
      log_level = "error",
      allowed_dirs = { "~/Code" },
    })
  end,
}

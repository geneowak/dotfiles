--- Sets up github copilot
return {
  {
    "github/copilot.vim",
    config = function()
      -- Disable the default <Tab> mapping
      vim.g.copilot_no_tab_map = true

      -- Maps <C-j> (Control + J) to accept Copilot suggestions
      vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "solarized",
        -- group = ...,
        callback = function()
          vim.api.nvim_set_hl(0, "CopilotSuggestion", {
            fg = "#555555",
            ctermfg = 8,
            force = true,
          })
        end,
      })

      -- Disable Copilot for specific filetypes
      -- vim.g.copilot_filetypes = {
      -- php = false,
      -- java = false,
      -- typescript = false,
      -- go = false,
      -- }
    end,
  },
}

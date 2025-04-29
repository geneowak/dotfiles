--- Sets up github copilot
return {
  {
    "github/copilot.vim",
    config = function()
      -- Set the keybinding for accepting Copilot suggestions
      -- Disable the default <Tab> mapping
      vim.g.copilot_no_tab_map = true
      -- Maps <C-j> (Control + J) to accept Copilot suggestions
      vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
}

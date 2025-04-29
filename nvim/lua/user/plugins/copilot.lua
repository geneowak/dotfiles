--- Sets up github copilot
return {
  {
    "github/copilot.vim",
    config = function()
      -- Disable the default <Tab> mapping
      vim.g.copilot_no_tab_map = true

      -- Maps <C-j> (Control + J) to accept Copilot suggestions
      vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

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

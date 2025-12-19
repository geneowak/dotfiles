--- Floating terminal

return {
  "voldikss/vim-floaterm",
  keys = {
    { "<F1>", ":FloatermToggle<CR>" },
    { "<F1>", "<Esc>:FloatermToggle<CR>",       mode = "i" },
    { "<F1>", "<C-\\><C-n>:FloatermToggle<CR>", mode = "t" },
  },
  cmd = { "FloatermToggle" },
  init = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_borderchars = "─│─│┌┐┘└"
    vim.g.floaterm_borderchars = ""
    vim.g.floaterm_title = ""
    -- " Configuration example

    -- " Set floaterm window's background to black
    -- vim.cmd('hi Floaterm guibg=#0d3a58')
    vim.cmd("hi Floaterm guibg=#0d3858")
    -- " Set floating window border line color to cyan, and background to orange
    vim.cmd("hi FloatermBorder guibg=#0d3858 guifg=#0088ff")
  end,
}

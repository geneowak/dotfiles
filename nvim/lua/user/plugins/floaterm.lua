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

    -- Set floaterm window's background
    vim.cmd("hi Floaterm guibg=#1A1A1A")
    -- Set floating window border line color and background
    vim.cmd("hi FloatermBorder guibg=#1A1A1A guifg=#424242")
  end,
}

-- Close buffers without closing the split window.

return {
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
    vim.keymap.set('n', '<Leader>Q', ':bufdo Bdelete<CR>')
    -- Close all open buffers
    vim.keymap.set('n', '<C-w>', ':bufdo bwipeout<CR>')
  end,
}

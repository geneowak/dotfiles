-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo.
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Close all open buffers
vim.keymap.set('n', '<C-w>', ':bufdo bwipeout<CR>')

-- Open the current file in the default program (on Mac this should just be just `open`).
--vim.keymap.set('n', '<Leader>x', ':!xdg-open %<CR><CR>')
vim.keymap.set('n', '<Leader>x', ':!open %<CR><CR>')

-- Move lines up and down.
--vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
--vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
--vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
--vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
--vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
--vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- Move lines up and down. # Mac specific bindings, similar to those above but alt/opt works differently
vim.keymap.set('i', '<C-A-down>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<C-A-up>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<C-A-down>', ':move .+1<CR>==')
vim.keymap.set('n', '<C-A-up>', ':move .-2<CR>==')
vim.keymap.set('v', '<C-A-down>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-A-up>', ":move '<-2<CR>gv=gv")

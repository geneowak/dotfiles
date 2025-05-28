vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.js,*.vue,*.jsx,*.json",
  command = "setlocal tabstop=2 shiftwidth=2",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "setlocal colorcolumn=120",
})

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.number = true
vim.opt.relativenumber = true

-- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.wildmode = "longest:full,full"

vim.opt.completeopt = "menuone,longest,preview"

vim.opt.title = true
vim.opt.titlestring = "%f"

vim.opt.mouse = "a"           -- enable mouse for all modes
vim.opt.mousemoveevent = true -- Allow hovering in bufferline

vim.opt.termguicolors = true

vim.opt.spell = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true                     -- enable the below listchars
vim.opt.listchars = { tab = "▸ ", trail = "·" }
vim.opt.fillchars:append({ eob = " " }) -- remove the ~ from end of buffer

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.clipboard = "unnamedplus" -- Use system clipboard

vim.opt.confirm = true            -- ask for confirmation instead of erroring

vim.opt.signcolumn = "yes:2"

vim.opt.undofile = true                -- persistent undo
vim.opt.backup = true                  -- automatically save a backup file
vim.opt.backupdir:remove(".")          -- keep backups out of the current directory

vim.opt.breakindent = true             -- maintain indent when wrapping indented lines
vim.opt.linebreak = true               -- wrap at word boundaries

vim.opt.shortmess:append({ I = true }) -- disable the splash screen

vim.opt.showmode = false
vim.opt.updatetime = 250   -- Decrease update time
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.inccommand = "split"

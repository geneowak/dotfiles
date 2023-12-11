global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = true,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
}

-- Keymaps

-- mark files you want to revisit later on
vim.keymap.set('n', 'hx', '<cmd>lua require("harpoon.mark").add_file()<CR>')

-- navigates to previous mark
vim.keymap.set('n', 'hn', '<cmd>require("harpoon.ui").nav_next() <CR>')

-- navigates to next mark
vim.keymap.set('n', 'hp', '<cmd>lua require("harpoon.ui").nav_prev()<CR>')

-- view all project marks
-- vim.keymap.set('n', 'hm', ':Telescope harpoon marks<CR>')
vim.keymap.set('n', 'hm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')

-- navigates to file 3 ... vim.diagnostic.open_float()
-- vim.keymap.set('n', '<Leader>d', '<cmd>lua require("harpoon.ui").nav_file()<CR>')


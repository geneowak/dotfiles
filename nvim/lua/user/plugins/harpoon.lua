-- Easier file navigation

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        global_settings = {
            -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
            save_on_toggle = true,

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
    },
    config = function (_, opts)
        require('harpoon'):setup()
    end,
    keys = function ()
        local harpoon = require("harpoon")

        -- Keymaps
        return {
        -- mark files you want to revisit later on
        {'hx', function() harpoon:list():add() end },
        -- navigates to previous mark
        {'hn', function() harpoon:list():next() end },
        -- navigates to next mark
        {'hp', function() harpoon:list():prev() end },
        -- view all project marks
        {'hm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end},
        -- navigates to file 3 ... vim.diagnostic.open_float()
        {"h1", function() harpoon:list():select(1) end},
        {"h2", function() harpoon:list():select(2) end},
        {"h3", function() harpoon:list():select(3) end},
        {"h4", function() harpoon:list():select(4) end},
        {"h5", function() harpoon:list():select(5) end},
        {"h6", function() harpoon:list():select(6) end},
        {"h7", function() harpoon:list():select(7) end},
        {"h8", function() harpoon:list():select(8) end},
        {"h9", function() harpoon:list():select(9) end},
    }
    end
}

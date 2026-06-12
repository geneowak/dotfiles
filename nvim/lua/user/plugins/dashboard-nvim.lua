-- Dashboard

return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"",
					"",
					"",
					" ",
					" ███  █████ █   █ █████  ███  █   █  ███  █   █   ",
					"█ ░░░ █░░░░░██  █░█░░░░░█ ░░█ █░  █░█ ░░█ █░ █ ░  ",
					"█░ ██░████░░█░█ █░████░░█░ ░█░█░█ █░█████░███ ░ ░ ",
					"█░░ █░█░░░░ █░░██░█░░░░ █░░ █░██░██░█░░░█░█░░█ ░  ",
					" ███ ░█████░█░░ █░█████░ ███ ░█░░ █░█░░░█░█░░░█   ",
					"  ░░░ ░░░░░░ ░░  ░░░░░░░  ░░░ ░░░░ ░░░░  ░░░░  ░  ",
					"   ░░░  ░░░░░ ░   ░ ░░░░░  ░░░  ░   ░ ░   ░ ░   ░ ",
					" ",
					"",
					"",
				},
				center = {
					{ icon = "  ", desc = "New file", action = "enew" },
					{ icon = " ", desc = "Search Sessions", key = "s", action = "AutoSession search" },
					{ icon = "  ", desc = "Find file               ", key = "f", action = "Telescope find_files" },
					{ icon = "  ", desc = "Recent files            ", key = "h", action = "Telescope oldfiles" },
					{ icon = "  ", desc = "Find Word               ", key = "g", action = "Telescope live_grep" },
					{ icon = " ", desc = "Explorer", key = "e", action = ":Neotree toggle" },
					{
						icon = " ",
						desc = "Manage Plugins",
						key = "m",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", desc = "Checkhealth", key = "h", action = ":checkhealth" },
					{ icon = " ", desc = "Quit", key = "q", action = ":qa!" },
				},
				footer = { "" },
			},
			hide = {
				statusline = false,
				tabline = false,
				winbar = false,
			},
		})
	end,
	init = function()
		vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#6272a4" })
		vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#f8f8f2" })
		vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#bd93f9" })
		vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#6272a4" })
		vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#6272a4" })
	end,
}

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavor = "mocha",
		integrations = {
			mason = true,
			treesitter = true,
			telescope = {
				enabled = true
			}
		}
	},
	init = function()
		vim.cmd.colorscheme("catppuccin")

		if vim.g.neovide then
			local colors = require("catppuccin.palettes").get_palette("mocha")
			vim.api.nvim_set_hl(0, "Normal", { bg = colors.base })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.mantle })
		else
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end
	end,
}

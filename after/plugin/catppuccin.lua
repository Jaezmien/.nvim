require('catppuccin').setup({
	flavor = "mocha",
	integrations = {
		mason = true,
		treesitter = true,
		telescope = {
			enabled = true
		}
	}
})

vim.cmd.colorscheme("catppuccin")

if vim.g.neovide then
	local colors = require("catppuccin.palettes").get_palette("mocha")
	vim.api.nvim_set_hl(0, "Normal", { bg = colors.base })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.mantle })
else
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

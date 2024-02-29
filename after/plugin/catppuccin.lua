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

function SetupCatppuccin()
	vim.cmd.colorscheme("catppuccin")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetupCatppuccin()

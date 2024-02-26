require('catppuccin').setup({
	flavor = "mocha",
	-- transparent_background = true,
	transparent_background = false,
})

function SetupCatppuccin()
	vim.cmd.colorscheme("catppuccin")

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetupCatppuccin()

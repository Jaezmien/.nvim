require('charm-freeze').setup({
	command = "freeze",
	output = function()
		return "./" .. os.date("%Y-%m-%d") .. "_freeze.png"
	end,
	theme = "catppuccin-mocha",
	window = true,
	show_line_numbers = true,
	font = {
		family = "JetbrainsMono Nerd Font",
		size = 10
	}
})

vim.keymap.set('v', '<leader>sc', '<cmd>Freeze<cr>', { desc = "[S]creenshot [C]ode" })

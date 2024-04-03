require('charm-freeze').setup({
	command = "freeze",
	output = function()
		return "./" .. os.date("%Y-%m-%d") .. "_freeze.webp"
	end,
	theme = "catppuccin-mocha",
	window = true,
	line_numbers = true
})

vim.keymap.set('v', '<leader>sc', '<cmd>Freeze<cr>')

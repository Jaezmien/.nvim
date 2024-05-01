return {
	'isabelroses/charm-freeze.nvim',
	opts = {

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
	},
	init = function()
		vim.keymap.set('v', '<leader>sc', '<cmd>Freeze<cr>', { desc = "[S]creenshot [C]ode" })
	end,
}

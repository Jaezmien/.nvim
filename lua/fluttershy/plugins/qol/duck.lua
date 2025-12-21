return {
	{
		'tamton-aquib/duck.nvim',
		keys = { "<leader>dd" },
		init = function()
			local duck = require('duck')
			vim.keymap.set('n', '<leader>dd', function() duck.hatch("🐄") end, { desc = "[D]uck [D]eliver" })
			vim.keymap.set('n', '<leader>dk', function() duck.cook() end, { desc = "[D]uck [K]ill" })
		end,
	},
}

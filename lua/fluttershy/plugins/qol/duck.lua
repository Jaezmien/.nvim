return {
	{
		'tamton-aquib/duck.nvim',
		keys = {
			{
				"<leader>dd",
				function() require('duck').hatch('🐄') end,
				mode = "n",
				desc = "[D]uck [D]eliver",
			},
			{
				"<leader>dk",
				function() require('duck').cook() end,
				mode = "n",
				desc = "[D]uck [K]ill",
			}
		},
		lazy = true,
	},
}

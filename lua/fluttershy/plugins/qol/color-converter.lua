return {
	"NTBBloodbath/color-converter.nvim",
	opts = {},
	keys = {
		{
			"<leader>cc",
			function() require('color-converter').cycle() end,
			mode = "n",
			desc = "[C]olor [C]onvert",
		}
	},
	lazy = true,
}

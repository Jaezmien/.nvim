return {
	"carldersell/floating-terminal.nvim",
	opts = {
		floating = {
			width = 0.8,
			height = 0.8,
		},
		bottom = {
			height = 0.3,
		},
	},
	keys = {
		{
			"<leader>tt",
			function() require('floating_terminal').toggle_floating_terminal() end,
			mode = "n",
			desc = "[T]oggle [T]erminal",
		}
	}
}

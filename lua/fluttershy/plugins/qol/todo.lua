return {
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{
				"<leader>ptd",
				":TodoTelescope<CR>",
				mode = "n",
				desc = "[P]roject [T]o[D]o List"
			}
		},
		event = "UIEnter",
		opts = {},
		config = true,
	},
}

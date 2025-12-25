return {
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {},
		keys = {
			{
				"<leader>ptd",
				":TodoTelescope<CR>",
				mode = "n",
				desc = "[P]roject [T]o[D]o List"
			}
		}
	},
}

return {
	{
		'numToStr/Comment.nvim',
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
		config = true
	},
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
		config = true
	},
}

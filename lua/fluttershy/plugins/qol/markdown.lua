return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		keys = {
			{
				"<leader>mv",
				":Markview toggle<CR>",
				mode = "n",
				desc = "Toggle [M]ark[V]iew",
			},
		}
	},
	{
		'brianhuster/live-preview.nvim',
		cmd = { "LivePreview" },
		dependencies = {
			-- You can choose one of the following pickers
			'nvim-telescope/telescope.nvim',
			-- 'ibhagwan/fzf-lua',
			-- 'echasnovski/mini.pick',
			--
		},
		keys = {
			{
				"<leader>lps",
				":LivePreview start<CR>",
				mode = "n",
				desc = "[L]ive-[P]review [S]tart"
			},
			{
				"<leader>lpc",
				":LivePreview close<CR>",
				mode = "n",
				desc = "[L]ive-[P]review [C]lose"
			},
		},
	}
}

return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		init = function()
			vim.keymap.set('n', '<leader>mv', '<cmd>Markview toggle<cr>', { desc = "Toggle [M]ark[V]iew" })
		end,
	},
	{
		'brianhuster/live-preview.nvim',
		dependencies = {
			-- You can choose one of the following pickers
			'nvim-telescope/telescope.nvim',
			-- 'ibhagwan/fzf-lua',
			-- 'echasnovski/mini.pick',
			--
		},
		init = function()
			vim.keymap.set('n', '<leader>lps', '<cmd>LivePreview start<cr>', { desc = "[L]ive-[P]review [S]tart" })
			vim.keymap.set('n', '<leader>lpc', '<cmd>LivePreview close<cr>', { desc = "[L]ive-[P]review [C]lose" })
		end,
	}
}

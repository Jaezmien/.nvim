return {
	{
		'folke/zen-mode.nvim',
		cmd = { "ZenMode" },
		init = function()
			vim.keymap.set({'n', 'v'}, "<leader>zz", ":ZenMode<CR>", { desc = "Toggle [Z]en Mode"})
		end
	},
	{
		'folke/twilight.nvim',
		event = "VeryLazy",
		dependencies = {
			-- Optional
			'folke/zen-mode.nvim'
		}
	}
}

return {
	{
		'folke/zen-mode.nvim',
		init = function()
			vim.keymap.set({'n', 'v'}, "<leader>zz", ":ZenMode<CR>", { desc = "Toggle [Z]en Mode"})
		end
	},
	{
		'folke/twilight.nvim',
		dependencies = { 'folke/zen-mode.nvim' }
	}
}

return {
	{
		'folke/zen-mode.nvim',
		cmd = { "ZenMode" },
		keys = {
			{
				"<leader>zz",
				":ZenMode<CR>",
				mode = {"n", "v"},
				desc = "Toggle [Z]en Mode",
			}
		},
	},
	{
		'folke/twilight.nvim',
		lazy = true,
		dependencies = {
			-- Optional
			'folke/zen-mode.nvim'
		}
	}
}

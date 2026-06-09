return {
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#1e1e2e",
			render = "compact",
			top_down = false,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			routes = {
				{
					filter = {
						kind = "progress",
						find = "Validate",
					},
					opts = { skip = true },
				},
				{
					filter = {
						kind = "progress",
						find = "Diagnostics",
					},
					opts = { skip = true },
				},
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	}
}

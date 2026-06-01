return {
	'rmagatti/auto-session',
	keys = {
		{
			"<leader>asr",
			":AutoSession restore<CR>",
			mode = "n",
			desc = "[A]uto[S]ession [R]estore",
		}
	},
	opts = {
		log_level = "error",
		auto_restore = false,
	},
	lazy = false,
}

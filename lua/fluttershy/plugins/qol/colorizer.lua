return {
	'NvChad/nvim-colorizer.lua',
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		filetypes = { "*" },
		user_default_options = {
			tailwind = true,
			RRGGBBAA = true,
			css = true
		}
	}
}

return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			icons_enabled = true,
			theme = 'catppuccin',
			component_separators = '|',
			section_separators = { left = '', right = '' },
		},
	},
	init = function()
		vim.opt.showmode = false
	end,
}

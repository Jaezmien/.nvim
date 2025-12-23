return {
	{
		'williamboman/mason.nvim',
		cmd = { "Mason", "MasonLog" },
		opts = {},
		config = true,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim' },
		opts = {},
		config = true,
	},
	{
		'neovim/nvim-lspconfig',
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'hrsh7th/cmp-nvim-lsp',

			-- JSON Schemas
			'b0o/schemastore.nvim',

			'ray-x/lsp_signature.nvim'
		},
	},
	{
		'nvimtools/none-ls.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local null = require('null-ls')

			null.setup {
				debug = true,
				sources = {
					null.builtins.formatting.prettier,
				}
			}
		end,
	}
}

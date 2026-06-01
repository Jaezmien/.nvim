return {
	{
		'mason-org/mason-lspconfig.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'neovim/nvim-lspconfig'
		},
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
	}
}

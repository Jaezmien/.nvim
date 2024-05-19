return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{
				'L3M0N4D3/LuaSnip',
				'saadparwaiz1/cmp_luasnip',
				'rafamadriz/friendly-snippets',
				'hrsh7th/cmp-nvim-lsp'
			}
		},
		opts = {},
		config = function()
			local cmp = require('cmp')
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			require('luasnip.loaders.from_vscode').lazy_load()

			cmp.setup({
				preselect = 'item',
				completion = {
					completeopt = 'menu,menuone,noinsert',
					keyword_length = 0
				},
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-p>'] = cmp.mapping.select_prev_item( cmp_select ),
					['<C-n>'] = cmp.mapping.select_next_item( cmp_select ),

					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),

					['<C-Space>'] = cmp.mapping.complete(),
					["<C-d>"] = cmp.mapping.complete(), -- Fallback due to Windows issue with C-Space. See: https://github.com/neovim/neovim/issues/8435

					['<C-e>'] = cmp.mapping.abort(),

					-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'treesitter' },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
				})
			})
		end,
	},
}

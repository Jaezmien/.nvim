return {

	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup({
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				-- List of parsers to ignore installing (or "all")
				-- ignore_install = { "javascript" },

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

				highlight = {
					enable = true,

					-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
					-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
					-- the name of the parser)
					-- list of language that will be disabled
					-- disable = { "c", "rust" },
					-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				}
			})
		end
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},

			-- JSON Schemas
			{'b0o/schemastore.nvim'},
		},

		config = function()
			local lsp = require('lsp-zero')

			lsp.preset('recommended')

			local cmp = require('cmp')
			local cmp_select = {behavior = cmp.SelectBehavior.Select}
			cmp.setup({
				preselect = 'item',
				completion = {
					completeopt = 'menu,menuone,noinsert',
					keyword_length = 0
				},
				sources = {
					{ name = 'treesitter' },
					{ name = 'nvim_lsp' },
					{ name = 'buffer' },
					{ name = 'luasnip' },
				},
				mapping = cmp.mapping.preset.insert({
					['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-d>"] = cmp.mapping.complete(), -- Fallback due to Windows issue with C-Space. See: https://github.com/neovim/neovim/issues/8435
					["<Tab>"] = cmp.mapping( function (fallback) fallback() end, { "i", "s" }),
					["<S-Tab>"] = nil,
				}),
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				}
			})

			lsp.set_preferences({
				suggest_lsp_servers = false,
				sign_icons = {
					error = 'E',
					warn = 'W',
					hint = 'H',
					info = 'I'
				}
			})

			lsp.on_attach(function(client, bufnr)
				local default_opts = { buffer = bufnr, remap = false }
				local function opts(t)
					local nt = {}

					for i,v in pairs(default_opts) do nt[i] = v end
					for i,v in pairs(t) do nt[i] = v end

					return nt
				end

				vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts({ desc = "[V]iew [W]orkspace [S]ymbol" }))
				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts({ desc = "[V]iew [D]iagnostics" }))
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts({ desc = "Next [D]iagnostic" }))
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts({ desc = "Previous [D]iagnostic]" }))

				vim.keymap.set("n", "<leader>vtd", function() vim.lsp.buf.type_definition(); vim.cmd('normal! zz') end, opts({ desc = "[V]iew [T]ype [D]efinition" }))
				vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts({ desc = "[V]iew [C]ode [A]ctions" }))
				vim.keymap.set("n", "<leader>vcd", function() vim.lsp.buf.definition(); vim.cmd('normal! zz') end, opts({ desc = "[V]iew [C]ode [D]efinition" }))
				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts({ desc = "[G]oto [D]efinition" })) -- Shortcut!
				vim.keymap.set("n", "<leader>vcr", function() require('telescope.builtin').lsp_references() end, opts({ desc = "[V]iew [C]ode [R]eferences" }))
				vim.keymap.set("n", "<leader>crn", function() vim.lsp.buf.rename() end, opts({ desc = "[C]ode [R]e[N]ame" }))

				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts({ desc = "Show LSP Information" }))
				vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts({ desc = "Show Code Signature" }))
			end)

			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = {
					'tsserver',
					'lua_ls',
					'rust_analyzer',
					'html',
				},
				handlers = {
					lsp.default_setup,
					lua_ls = function()
						local lua_opts = lsp.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
				}
			})

			lsp.setup()

			vim.diagnostic.config({
				virtual_text = true
			})

			-- Ensure you have @vue/language-server installed with `npm i -g @vue/language-server`

			local mason_registry = require('mason-registry')
			local ts_plugin_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'
			require('lspconfig').tsserver.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = ts_plugin_path,
							languages = { 'vue' }
						}
					}
				},
				filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
			})
			require('lspconfig').volar.setup({})

			-- JSON Schema
			require('lspconfig').jsonls.setup({
				settings = {
					json = {
						schemas = require('schemastore').json.schemas(),
						validate = { enable = true }
					}
				}
			})
		end,
	},

	{ 'nvim-treesitter/nvim-treesitter-context', dependencies = { { 'nvim-treesitter/nvim-treesitter' } } }, -- Shows the current code context
	{
		'windwp/nvim-ts-autotag',
		dependencies = { { 'nvim-treesitter/nvim-treesitter' } },
		opts = {
			autotag = {
				enable = true
			}
		},
	},
}

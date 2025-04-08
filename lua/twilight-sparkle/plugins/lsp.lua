return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		opts = {},
		config = true,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim' },
		lazy = false,
		opts = {
			ensure_installed = { 'ts_ls', 'lua_ls', 'html' },
		},
		config = true,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'hrsh7th/cmp-nvim-lsp',

			-- JSON Schemas
			'b0o/schemastore.nvim',

			'ray-x/lsp_signature.nvim'
		},
		lazy = false,
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require('lspconfig')

			require('mason-lspconfig').setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities
					})
				end,
				['ts_ls'] = function()
					-- XXX: Ensure you have @vue/language-server installed with `npm i -g @vue/language-server`
					local mason_registry = require('mason-registry')
					local ts_plugin_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
						'/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'
					lspconfig.ts_ls.setup({
						capabilities = capabilities,

						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = ts_plugin_path,
									languages = { 'vue' }
								}
							},
						},
						filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
					})
				end,
				['volar'] = function()
					lspconfig.volar.setup({})
				end,
				['jsonls'] = function()
					lspconfig.jsonls.setup({
						settings = {
							json = {
								schemas = require('schemastore').json.schemas(),
								validate = { enable = true }
							}
						}
					})
				end,
			})
		end,
		init = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					local default_opts = { buffer = ev.buf, remap = false }

					local function opts(t)
						local nt = {}

						for i, v in pairs(default_opts) do nt[i] = v end
						for i, v in pairs(t) do nt[i] = v end

						return nt
					end

					vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol,
						opts({ desc = "[V]iew [W]orkspace [S]ymbol" }))
					vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts({ desc = "[V]iew [D]iagnostics" }))
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts({ desc = "Next [D]iagnostic" }))
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts({ desc = "Previous [D]iagnostic]" }))

					vim.keymap.set("n", "<leader>vtd",
						function()
							vim.lsp.buf.type_definition(); vim.cmd('normal! zz')
						end, opts({ desc = "[V]iew [T]ype [D]efinition" }))
					vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,
						opts({ desc = "[V]iew [C]ode [A]ctions" }))
					vim.keymap.set("n", "<leader>vcd", function()
						vim.lsp.buf.definition(); vim.cmd('normal! zz')
					end, opts({ desc = "[V]iew [C]ode [D]efinition" }))
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts({ desc = "[G]oto Symbol [D]efinition" })) -- Shortcut!
					vim.keymap.set("n", "<leader>vcr", function() require('telescope.builtin').lsp_references() end,
						opts({ desc = "[V]iew [C]ode [R]eferences" }))
					vim.keymap.set("n", "<leader>crn", vim.lsp.buf.rename, opts({ desc = "[C]ode [R]e[N]ame" }))

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts({ desc = "Show Symbol Information" }))
					vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts({ desc = "Show Code Signature" }))
				end,
			})

			vim.fn.sign_define('DiagnosticSignError', { text = 'X', texthl = 'DiagnosticSignError' })
			vim.fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
			vim.fn.sign_define('DiagnosticSignInfo', { text = '?', texthl = 'DiagnosticSignInfo' })
			vim.fn.sign_define('DiagnosticSignHint', { text = 'H', texthl = 'DiagnosticSignHint' })
		end
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			always_trigger = true,
			doc_lines = 0,

			floating_window = false,
			floating_window_off_x = 0,
			floating_window_off_y = 0,
			-- fix_pos = true,

			hint_enable = true,
			hint_prefix = " ",

			handle_opts = {
				border = "rounded"
			},
		},
		init = function()
			vim.keymap.set('n', '<Leader>k', function()
				vim.lsp.buf.signature_help()
			end, { silent = true, noremap = true, desc = 'Toggle Signature' })
			vim.keymap.set('i', '<C-k>', function()
				-- vim.lsp.buf.signature_help()
				require('lsp_signature').toggle_float_win()
			end, { silent = true, noremap = true, desc = 'Toggle Signature' })
		end,
	}
}

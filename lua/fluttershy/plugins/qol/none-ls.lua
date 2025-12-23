return {
	{
		'nvimtools/none-ls.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{
				"<leader>ff",
				vim.lsp.buf.format,
				mode = "n",
				desc = "[F]ormat [F]ile",
			}
		},
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

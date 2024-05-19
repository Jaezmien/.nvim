return  {
	'nvimtools/none-ls.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local null = require('null-ls')

		null.setup{
			sources = {
				null.builtins.formatting.prettier.with({
					filetypes = {
						"javascript","typescript","css","scss","html","json","yaml","markdown","graphql","md","txt",
					},
				}),
			}
		}
	end,
	init = function()
		vim.keymap.set('n', '<leader>ff', function()
			vim.lsp.buf.format()
			vim.cmd('w')
		end, { desc = "[F]ormat [F]ile" })
	end,
}

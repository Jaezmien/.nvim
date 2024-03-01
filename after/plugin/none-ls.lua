local null = require('null-ls')

null.setup{
	sources = {
		null.builtins.formatting.prettier.with({
			extra_args = { "--use-tabs", "--tab-width 4", "--no-semi", "--single-quote" }
		}),
	}
}

vim.keymap.set('n', '<leader>ff', function()
	vim.lsp.buf.format()
	vim.cmd('w')
end)

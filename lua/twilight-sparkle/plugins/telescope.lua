return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim'
		},
		opts = {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git",
					"%.png",
					"%.jpeg",
					"%.jpg",
					"%.gif",
					"%.zip",
				}
			}
		},
		init = function()
			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "[P]roject [F]ind Files" })
			vim.keymap.set('n', '<leader>ps', builtin.treesitter, { desc = "[P]roject Tree[S]itter" })
			vim.keymap.set('n', '<leader>ts', builtin.lsp_document_symbols, { desc = "Project [T]ree[S]itter" })
			vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "[G]it [F]ind" })
			vim.keymap.set('n', '<leader>pg', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "[P]roject [G]rep" })
			vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "[V]iew [H]elp" })
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
	},
	{
		'stevearc/dressing.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = true,
	}
}

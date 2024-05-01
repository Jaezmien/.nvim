return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5', dependencies = { {'nvim-lua/plenary.nvim'} },
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
		vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "[G]it [F]ind" })
		vim.keymap.set('n', '<leader>pg', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "[P]roject [G]rep" })
		vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "[V]iew [H]elp" })

	end,
}

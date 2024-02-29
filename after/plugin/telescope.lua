require('telescope').setup{
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
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.treesitter, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

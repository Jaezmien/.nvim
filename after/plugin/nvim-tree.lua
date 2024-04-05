require('nvim-tree').setup({
	actions = {
		open_file = {
			quit_on_open = true
		}
	}
})

vim.keymap.set("n", "<leader>pv", '<cmd>NvimTreeFindFile<CR>', { desc = "[P]roject [V]iew" })

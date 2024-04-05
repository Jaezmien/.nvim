require('nvim-tree').setup({
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false
			}
		}
	},
	view = {
		width = 35,
	},
})

vim.keymap.set("n", "<leader>pv", '<cmd>NvimTreeFindFile<CR>', { desc = "[P]roject [V]iew" })

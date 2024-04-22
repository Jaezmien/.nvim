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

local api = require('nvim-tree.api')
vim.keymap.set("n", "<leader>pv", function()
	if api.tree.is_visible() then
		api.tree.close()
	else
		api.tree.open()
		api.tree.find_file()
	end
end, { desc = "[P]roject [V]iew" })

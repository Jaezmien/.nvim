return {
	{
		'nvim-tree/nvim-tree.lua',
		opts = {
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
		},
		init = function()

			local api = require('nvim-tree.api')
			vim.keymap.set("n", "<leader>pv", function()
				if api.tree.is_visible() then
					api.tree.close()
				else
					api.tree.open()
					api.tree.find_file()
				end
			end, { desc = "[P]roject [V]iew" })

		end,
	},
	{
		'nvim-tree/nvim-web-devicons',
		dependencies = { 'nvim-tree/nvim-tree.lua' }
	},
}

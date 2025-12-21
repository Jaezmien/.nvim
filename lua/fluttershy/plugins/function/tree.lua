return {
	{
		'nvim-tree/nvim-tree.lua',
		lazy = true,
		keys = {
			{
				"<leader>pv",
				function()
					local api = require('nvim-tree.api')
					if api.tree.is_visible() then
						api.tree.close()
					else
						api.tree.open()
						api.tree.find_file()
					end
				end,
				mode = "n",
				desc = "[P]roject [V]iew",
			}
		},
		cmd = { "NvimTreeToggle", "NvimTreeOpen" },
		opts = {
			disable_netrw = true,
			hijack_netrw = true,

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
				side = "right",
			},
			filters = {
				custom = {
					"^.git$",
					"node_modules",
				}
			}
		},
	},
	{
		'nvim-tree/nvim-web-devicons',
		dependencies = { 'nvim-tree/nvim-tree.lua' },
		cmd = { "NvimTreeToggle", "NvimTreeOpen" },
		opts = {
			strict = true,
			override_by_extension = {
				astro = {
					icon = "",
					color = "#EF8547",
					name = "astro",
				},
			},
		}
	},
}

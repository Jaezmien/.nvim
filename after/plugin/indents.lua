local highlights = { "DashieRed", "DashieOrange", "DashieYellow", "DashieGreen", "DashiePurple" }
local rainbow = {
	DashieRed = "#EC4141",
	DashieOrange = "#EF7135",
	DashieYellow = "#FAF5AB",
	DashieGreen = "#5FBB4E",
	DashiePurple = "#632E86"
}

local hooks = require('ibl.hooks')
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	for key, color in pairs(rainbow) do
		vim.api.nvim_set_hl(0, key, { fg = color })
	end
end)

vim.g.rainbow_delimiters = { highlight = highlights }
require('ibl').setup {
	indent = {
		char = '┆',
		highlight = highlights,
	},
	scope = {
		char = '┃',
		highlight = highlights,
	}
}

local rainbow = {
	Dashie01Red = "#EC4141",
	Dashie02Orange = "#EF7135",
	Dashie03Yellow = "#FAF5AB",
	Dashie04Green = "#5FBB4E",
	Dashie05Purple = "#632E86"
}

local highlights = {}
for key, _ in pairs(rainbow) do table.insert(highlights, key) end

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

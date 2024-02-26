-- Show line numbers
vim.opt.number = true
vim.opt.wrap = false

-- #TabIndentGang
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- Don't create backups
vim.opt.backup = false
vim.opt.swapfile = false

-- Visualizing indents
vim.opt.list = true
vim.opt.listchars = "tab:» ,trail:·,extends:»,precedes:«"

-- Unfuckup search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrolling
vim.opt.scrolloff = 8

-- Filetypes
vim.filetype.add({
	extension = {
		hlsl = 'glsl',
		frag = 'glsl',
		vert = 'glsl'
	}
})

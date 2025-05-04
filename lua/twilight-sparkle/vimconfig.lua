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

-- Colors!
vim.opt.termguicolors = true

-- Disabling NetRW
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Show color column
vim.opt.colorcolumn = "100"

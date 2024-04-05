local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
	-- REALLY (not) Important
	{ "catppuccin/nvim", name = "catppuccin" },
	{ 'tamton-aquib/duck.nvim' },

	-- Status Line
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

	-- Navigator
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5', dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	-- LSP-related
	{ 'nvim-treesitter/nvim-treesitter', },
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	},
	-- LSP-related (Visual)
	{ 'nvim-treesitter/nvim-treesitter-context', dependencies = { { 'nvim-treesitter/nvim-treesitter' } } }, -- Shows the current code context
	{
		'windwp/nvim-ts-autotag',
		dependencies = { { 'nvim-treesitter/nvim-treesitter' } },
		config = function()
			require('nvim-ts-autotag').setup{ autotag = { enable = true } }
		end
	},

	-- Linter & Formatter
	{
		'nvimtools/none-ls.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},

	-- QOL
	{
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup{} end,
	},
	{
		'kylechui/nvim-surround',
		event = 'VeryLazy',
		config = function() require('nvim-surround').setup{} end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit" },
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- File Explorer
	{ 'nvim-tree/nvim-tree.lua' },
	{
		'nvim-tree/nvim-web-devicons',
		dependencies = { 'nvim-tree/nvim-tree.lua' }
	},

	-- Pretty Visuals
	{ 'lukas-reineke/indent-blankline.nvim', name = 'ibl' },
	{ 'HiPhish/rainbow-delimiters.nvim' },
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function() require('nvim-autopairs').setup{} end,
	},
	{ 'NvChad/nvim-colorizer.lua' },
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function() require('todo-comments').setup{} end,
	},

	-- I just think they're neat
	{ 'folke/zen-mode.nvim' },
	{
		'folke/twilight.nvim',
		dependencies = { 'folke/zen-mode.nvim' }
	},
	{ 'isabelroses/charm-freeze.nvim' }
})

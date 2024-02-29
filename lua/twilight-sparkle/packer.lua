-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		"catppuccin/nvim",
		as = "catppuccin"
	}

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		{run = ':TSUpdate'}
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
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
	}

	use {
		'lukas-reineke/indent-blankline.nvim',
		as = 'ibl'
	}
	use {
		'HiPhish/rainbow-delimiters.nvim'
	}

	use {
		'nvim-treesitter/nvim-treesitter-context',
		requires = { { 'nvim-treesitter/nvim-treesitter' } }
	}
	use {
		'windwp/nvim-ts-autotag',
		requires = { { 'nvim-treesitter/nvim-treesitter' } }
	}
	use {
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			require('nvim-autopairs').setup{}
		end,
	}

	use {
		'numToStr/Comment.nvim',
	}

	use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup{}
		end,
	}

	use {
		'nvim-lualine/lualine.nvim',
	}

	-- HIGHLY important
	use {
		'tamton-aquib/duck.nvim'
	}
end)

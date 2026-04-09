vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 2

if vim.fn.executable("tree-sitter") == 0 then
	vim.notify("tree-sitter-cli not installed!", vim.log.levels.WARN)
	return {}
end

return {
	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'main',
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ignored_ft = {
				'checkhealth',
				'lazy',
				'mason',
				'snacks_dashboard',
				'snacks_notif',
				'snacks_win',
			}

			local group = vim.api.nvim_create_augroup('NvimTreesitter', { clear = true })
			vim.api.nvim_create_autocmd('FileType', {
				group = group,
				callback = function(event)
					if vim.tbl_contains(ignored_ft, event.match) then return end
					pcall(vim.treesitter.start, event.buf)

					vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
					vim.opt.foldmethod = 'expr'
					vim.opt.foldlevelstart = 2

					local lang = vim.treesitter.language.get_lang(event.match) or event.match
					require('nvim-treesitter').install({ lang })
				end,
			})
		end,
	},

	 -- Shows the current code context
	{
		'nvim-treesitter/nvim-treesitter-context',
		dependencies = { { 'nvim-treesitter/nvim-treesitter' } }
	},

	{
		'windwp/nvim-ts-autotag',
		event = "InsertEnter",
		dependencies = { { 'nvim-treesitter/nvim-treesitter' } },
		opts = {
			autotag = {
				enable = true
			}
		},
	},
}

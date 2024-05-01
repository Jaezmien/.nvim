return {
	"kdheepak/lazygit.nvim",
	cmd = { "LazyGit" },
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		vim.keymap.set('n', '<leader>lg', ":LazyGit<CR>", { desc = "[L]azy[G]it" })
	end,
}

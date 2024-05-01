return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	ft = { "markdown" },
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }

		-- vim.keymap.set('n', '<leader>mp', ":MarkdownPreview<CR>", { desc = "[M]arkdown [P]review Start" })
		-- vim.keymap.set('n', '<leader>mps', ":MarkdownPreviewStop<CR>", { desc = "[M]arkdown [P]review [S]top" })
		-- vim.keymap.set('n', '<leader>mpt', ":MarkdownPreviewToggle<CR>", { desc = "[M]arkdown [P]review [T]oggle" })

		vim.keymap.set('n', '<leader>mp', ":MarkdownPreviewToggle<CR>", { desc = "[M]arkdown [P]review" })
	end
}

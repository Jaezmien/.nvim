return {
	'f-person/git-blame.nvim',
	event = "VeryLazy",
	keys = {
		{
			"<leader>tgb",
			":GitBlameToggle<CR>",
			mode = "n",
			desc = "[T]oggle [G]it [B]lame"
		}
	},
	opts = {
		enabled = false,
		message_template = " <author> • <date> • <sha> (<summary>)",
		message_when_not_committed = " Uncommitted change",
		date_format = "%m-%d-%Y %H:%M:%S",
		virtual_text_column = 100,
	},
}

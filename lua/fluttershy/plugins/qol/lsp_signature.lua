return {
	{
		"ray-x/lsp_signature.nvim",
		keys = {
			{
				"<leader>k", function()
					vim.lsp.buf.signature_help()
				end,
				mode = "n",
				desc = "Toggle Signature",
				silent = true,
				noremap = true,
			},
			{
				"<C-k>", function()
					require('lsp_signature').toggle_float_win()
				end,
				mode = "i",
				desc = "Toggle Signature",
				silent = true,
				noremap = true,
			}
		},
		event = "InsertEnter",
		opts = {
			bind = true,
			always_trigger = true,
			doc_lines = 0,

			floating_window = false,
			floating_window_off_x = 0,
			floating_window_off_y = 0,
			-- fix_pos = true,

			hint_enable = true,
			hint_prefix = " ",

			handle_opts = {
				border = "rounded"
			},
		},
	},
}

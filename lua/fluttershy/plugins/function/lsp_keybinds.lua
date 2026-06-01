vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local default_opts = { buffer = ev.buf, remap = false }

		local function opts(t)
			local nt = {}

			for i, v in pairs(default_opts) do nt[i] = v end
			for i, v in pairs(t) do nt[i] = v end

			return nt
		end

		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol,
			opts({ desc = "[V]iew [W]orkspace [S]ymbol" }))

		vim.keymap.set("n", "<leader>vd", "<cmd>Telescope diagnostics<cr>",
			opts({ desc = "[V]iew [D]iagnostics" }))

		-- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts({ desc = "[V]iew [D]iagnostics" }))
		-- vim.keymap.set("n", "<leader>vd", function()
		-- 	vim.diagnostic.setqflist({ bufnr = 0, open = true })
		-- end, opts({ desc = "[V]iew [D]iagnostics" }))

		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts({ desc = "Next [D]iagnostic" }))
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts({ desc = "Previous [D]iagnostic]" }))

		vim.keymap.set("n", "<leader>vtd",
			function()
				vim.lsp.buf.type_definition(); vim.cmd('normal! zz')
			end, opts({ desc = "[V]iew [T]ype [D]efinition" }))

		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,
			opts({ desc = "[V]iew [C]ode [A]ctions" }))

		vim.keymap.set("n", "<leader>vcd", function()
			vim.lsp.buf.definition(); vim.cmd('normal! zz')
		end, opts({ desc = "[V]iew [C]ode [D]efinition" }))

		vim.keymap.set("n", "gd", vim.lsp.buf.definition,
			opts({ desc = "[G]oto Symbol [D]efinition" })) -- Shortcut!

		vim.keymap.set("n", "<leader>vcr", function() require('telescope.builtin').lsp_references() end,
			opts({ desc = "[V]iew [C]ode [R]eferences" }))

		vim.keymap.set("n", "<leader>crn", vim.lsp.buf.rename, opts({ desc = "[C]ode [R]e[N]ame" }))

		vim.keymap.set("n", "K", vim.lsp.buf.hover,
			opts({ desc = "Show Symbol Information" }))

		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help,
			opts({ desc = "Show Code Signature" }))
	end,
})

return {}

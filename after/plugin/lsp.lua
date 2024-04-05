local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert',
		keyword_length = 0
	},
	sources = {
		{ name = 'treesitter' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-d>"] = cmp.mapping.complete(), -- Fallback due to Windows issue with C-Space. See: https://github.com/neovim/neovim/issues/8435
		["<Tab>"] = cmp.mapping( function (fallback) fallback() end, { "i", "s" }),
		["<S-Tab>"] = nil,
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	}
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

lsp.on_attach(function(client, bufnr)
	local default_opts = { buffer = bufnr, remap = false }
	local function opts(t)
		local nt = {}

		for i,v in pairs(default_opts) do nt[i] = v end
		for i,v in pairs(t) do nt[i] = v end

		return nt
	end

	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts({ desc = "[V]iew [W]orkspace [S]ymbol" }))
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts({ desc = "[V]iew [D]iagnostics" }))
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts({ desc = "Next [D]iagnostic" }))
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts({ desc = "Previous [D]iagnostic]" }))

	vim.keymap.set("n", "<leader>vtd", function() vim.lsp.buf.type_definition(); vim.cmd('normal! zz') end, opts({ desc = "[V]iew [T]ype [D]efinition" }))
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts({ desc = "[V]iew [C]ode [A]ctions" }))
	vim.keymap.set("n", "<leader>vcd", function() vim.lsp.buf.definition(); vim.cmd('normal! zz') end, opts({ desc = "[V]iew [C]ode [D]efinition" }))
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts({ desc = "[G]oto [D]efinition" })) -- Shortcut!
	vim.keymap.set("n", "<leader>vcr", function() require('telescope.builtin').lsp_references() end, opts({ desc = "[V]iew [C]ode [R]eferences" }))
	vim.keymap.set("n", "<leader>crn", function() vim.lsp.buf.rename() end, opts({ desc = "[C]ode [R]e[N]ame" }))

	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts({ desc = "Show LSP Information" }))
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts({ desc = "Show Code Signature" }))
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'lua_ls',
		'rust_analyzer',
		'html',
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})

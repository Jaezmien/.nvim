return {
	{
		'leoluz/nvim-dap-go',
		ft = 'go',
		dependencies = { 'mfussenegger/nvim-dap' },
		config = function(_, opts)
			require('dap-go').setup(opts)

			vim.keymap.set('n', "<leader>dbp", ":DapToggleBreakpoint<CR>", { desc = "[D]ebugger [B]reak[P]oint"})
			-- vim.keymap.set('n', "<leader>dsp", function()
			-- 	local widgets = require('dap.ui.widgets')
			-- 	local sidebar = widgets.sidebar(widgets.scopes)
			-- 	sidebar.open()
			-- end, { desc = "Open [D]ebugger [S]ide[P]anels"})

			vim.keymap.set('n', "<leader>drt", function() require('dap-go').debug_test() end, { desc = "[D]ebugger [R]un Nearest [T]est"})

			-- require('core.utils').load_mappings('dap_go')
		end,
	},
	{
		'mfussenegger/nvim-dap',
		init = function()
			-- require('core.utils').load_mappings('dap')
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		ft = 'go',
		dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
		config = function()
			local dui = require('dapui')
			dui.setup()

			vim.keymap.set('n', "<leader>dtu", function() dui.toggle() end, { desc = "[D]ebugger [T]oggle [U]I"})
		end
	}
}

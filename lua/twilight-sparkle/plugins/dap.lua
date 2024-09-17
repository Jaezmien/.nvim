return {
	{
		'leoluz/nvim-dap-go',
		ft = 'go',
		dependencies = { 'mfussenegger/nvim-dap' },
		config = function(_, opts)
			require('dap-go').setup(opts)

			-- vim.keymap.set('n', "<leader>dsp", function()
			-- 	local widgets = require('dap.ui.widgets')
			-- 	local sidebar = widgets.sidebar(widgets.scopes)
			-- 	sidebar.open()
			-- end, { desc = "Open [D]ebugger [S]ide[P]anels"})

			-- vim.keymap.set('n', "<leader>drt", function() require('dap-go').debug_test() end,
			-- 	{ desc = "[D]ebugger [R]un Nearest [T]est" })

			-- require('core.utils').load_mappings('dap_go')
		end,
	},
	{
		'mfussenegger/nvim-dap',
		init = function()
			vim.keymap.set('n', "<leader>dtb", function() require('dap').toggle_breakpoint() end, { desc = "[D]ebugger [T]oggle [B]reakpoint" })

			vim.keymap.set('n', "<leader>drl", function() require('dap').run_last() end, { desc = "[D]ebugger [R]un [L]ast" })

			vim.keymap.set('n', "<leader>dbc", function() require('dap').continue() end, { desc = "[D]e[B]ugger [C]ontinue" })
			vim.keymap.set('n', "<leader>dbo", function() require('dap').step_over() end, { desc = "[D]e[B]ugger Step [O]ver" })
			vim.keymap.set('n', "<leader>dbi", function() require('dap').step_into() end, { desc = "[D]e[B]ugger Step [I]nto" })
			vim.keymap.set('n', "<leader>dbx", function() require('dap').step_out() end, { desc = "[D]e[B]ugger Step E[x]it" })

			vim.keymap.set('n', "<leader>dbr", function() require('dap').restart() end, { desc = "[D]e[B]ugger [R]estart" })
			vim.keymap.set('n', "<leader>dbt", function() require('dap').terminate() end, { desc = "[D]e[B]ugger [T]erminate" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		ft = 'go',
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dui = require('dapui')
			dui.setup()

			vim.keymap.set('n', "<leader>dtu", function() dui.toggle() end, { desc = "[D]ebugger [T]oggle [U]I" })

			local dap = require('dap')
			dap.listeners.before.attach.dapui_config = function()
				dui.open()
			end
			dap.listeners.before.launch.dui_config = function()
				dui.open()
			end
			dap.listeners.before.event_terminated.dui_config = function()
				dui.close()
			end
			dap.listeners.before.event_exited.dui_config = function()
				dui.close()
			end
		end
	}
}

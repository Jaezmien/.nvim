return {
	{
		'mfussenegger/nvim-dap',
		keys = {
			{
				"<leader>dbb",
				function() require('dap').toggle_breakpoint() end,
				mode = "n",
				desc = "[D]e[B]ugger Toggle [B]reakpoint"
			},

			{
				"<leader>dbc",
				function() require('dap').continue() end,
				mode = "n",
				desc = "[D]e[B]ugger [C]ontinue"
			},
			{
				"<leader>dbr",
				function() require('dap').restart() end,
				mode = "n",
				desc = "[D]e[B]ugger [R]estart"
			},
			{
				"<leader>dbt",
				function() require('dap').terminate() end,
				mode = "n",
				desc = "[D]e[B]ugger [T]erminate"
			},

			{
				"<leader>dbn",
				function() require('dap').step_over() end,
				mode = "n",
				desc = "[D]e[B]ugger Step [N]ext"
			},
			{
				"<leader>dbi",
				function() require('dap').step_into() end,
				mode = "n",
				desc = "[D]e[B]ugger Step [I]nto"
			},
			{
				"<leader>dbo",
				function() require('dap').step_out() end,
				mode = "n",
				desc = "[D]e[B]ugger Step [O]out"
			},
		},
	},
	{
		'rcarriga/nvim-dap-ui',
		keys = {
			{
				"<leader>dbu",
				function() require('dapui').toggle() end,
				mode = "n",
				desc = "[D]e[B]ugger Toggle [U]I"
			},
		},
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-neotest/nvim-nio',
		},
		opts = {},
		init = function()
			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		'jay-babu/mason-nvim-dap.nvim',
		dependencies = {
			'mfussenegger/nvim-dap',
			'mason-org/mason.nvim'
		},
	},
	{
		'leoluz/nvim-dap-go',
		ft = 'go',
		dependencies = { 'mfussenegger/nvim-dap' },
		config = function()
			require('dap-go').setup()
		end,
	}
}

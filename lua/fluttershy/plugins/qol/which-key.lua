return {
	'folke/which-key.nvim',
	
	-- This would be cool if it wasn't slow on first activation
	-- keys = { "<leader>" },
	
	-- Slower, but at least we can immediately utilize it
	event = "UIEnter",

	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = true
}

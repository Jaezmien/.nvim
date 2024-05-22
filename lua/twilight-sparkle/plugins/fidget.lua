return {
	'j-hui/fidget.nvim',
	config = function()
		require('fidget').setup({
			notification = {
				window = {
					winblend = 0,
					relative = "editor"
				},
				override_vim_notify = true,
			}
		})
	end
}

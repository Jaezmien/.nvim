return {
	"glepnir/template.nvim",
	dependencies = { 'nvim-telescope/telescope.nvim' },

	cmd = { "Template" },
	config = function()
		require('template').setup({
			temp_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "templates"),
			author = "Jaezmien Naejara",
			email = "contact@jaezmien.com"
		})

		require("telescope").load_extension('find_template')
	end,
}

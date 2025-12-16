if vim.g.neovide then
	return {}
end

return {
	"3rd/image.nvim",
	opts = {
		backend = "kitty",
		processor = "magick_cli"
	}
}

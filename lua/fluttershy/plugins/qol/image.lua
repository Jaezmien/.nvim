if vim.g.neovide then
	return {}
end

if vim.fn.executable("magick") == 0 then
	return {}
end

return {
	"3rd/image.nvim",
	opts = {
		backend = "kitty",
		processor = "magick_cli"
	}
}

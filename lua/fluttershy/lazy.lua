-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
	spec = {
		-- These are plugins that I **really** don't like working without.
		{ import = "fluttershy.plugins.function" },

		-- These are plugins that isn't really important for workflow, just that it's pretty.
		{ import = "fluttershy.plugins.style" },

		-- These are plugins that isn't really necessary, but it's nice to have - I'll live without them.
		{ import = "fluttershy.plugins.qol" },
	}
})

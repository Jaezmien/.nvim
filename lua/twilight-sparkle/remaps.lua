vim.g.mapleader = " "

-- Move selection on highlight
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered on any scroll action
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- ThePrimeagen's greatest remap ever (but now dumbed down)
vim.keymap.set("x", "p", [["_dP]])

local uname = vim.loop.os_uname().sysname
if uname == 'Linux' then
	-- Leader shortcut for yanking to host clipboard
	vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
	vim.keymap.set("n", "<leader>Y", [["+Y]])

	-- Leader shortcut for pasting from host clipboard
	vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
	vim.keymap.set("n", "<leader>P", [["+P]])
else
	vim.keymap.set({"n", "v"}, "<leader>y", [["*y]])
	vim.keymap.set("n", "<leader>Y", [["*Y]])

	vim.keymap.set({"n", "v"}, "<leader>p", [["*p]])
	vim.keymap.set("n", "<leader>P", [["*P]])
end

-- Shortcut for word replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- It's enough
vim.keymap.set("n", "<leader>bp", ":bp<CR>")
vim.keymap.set("n", "<leader>bn", ":bn<CR>")

-- Window split shortcuts
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set('n', '<leader>wv', '<C-W>s')
vim.keymap.set('n', '<leader>w<S-v>', '<C-W>v')
vim.keymap.set('n', '<leader>wq', '<C-W>q')

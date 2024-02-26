vim.g.mapleader = " "

-- Convenient shortcut for E
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

-- Leader shortcut for yanking to host clipboard (Windows)
vim.keymap.set({"n", "v"}, "<leader>y", [["*y]])
vim.keymap.set("n", "<leader>Y", [["*Y]])

-- Leader shortcut for pasting from host clipboard (Windows)
vim.keymap.set({"n", "v"}, "<leader>p", [["*p]])
vim.keymap.set("n", "<leader>P", [["*P]])

-- Shortcut for word replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

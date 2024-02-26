local duck = require('duck')
vim.keymap.set('n', '<leader>dd', function() duck.hatch("Ö") end, {})
vim.keymap.set('n', '<leader>dk', function() duck.cook() end, {})

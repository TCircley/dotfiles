vim.g.mapleader = ' '

local opts = { noremap = true, silent = true, nowait = true }

vim.keymap.set('n', ';', ':', { noremap = true, silent = false, nowait = true })
vim.keymap.set('n', '<leader><CR>', ':nohlsearch<CR>', opts)

-- split window
vim.keymap.set('n', 'sl', ':vsplit<CR>', opts)
vim.keymap.set('n', 'sj', ':split<CR>', opts)
vim.keymap.set('n', 'sv', '<C-w>t<C-w>H', opts)
vim.keymap.set('n', 'sh', '<C-w>t<C-w>K', opts)

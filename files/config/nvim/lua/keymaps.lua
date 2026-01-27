-- Leader key
vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>f', '', { desc = 'Find' })
vim.keymap.set('n', '<leader>o', '', { desc = 'Open' })
vim.keymap.set('n', '<leader>t', '', { desc = 'Toggle' })

-- Window manipulation
vim.keymap.set('n', '<leader>w', '<C-w>', { desc = 'Window' })
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Go to the left window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Go to the down window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Go to the up window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Go to the right window' })
vim.keymap.set('n', '<leader>wH', '<C-w>H', { desc = 'Move window to far left' })
vim.keymap.set('n', '<leader>wJ', '<C-w>J', { desc = 'Move window to far bottom' })
vim.keymap.set('n', '<leader>wK', '<C-w>K', { desc = 'Move window to far top' })
vim.keymap.set('n', '<leader>wL', '<C-w>L', { desc = 'Move window to far right' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close all other windows' })

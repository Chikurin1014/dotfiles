-- Leader key
vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>f', '', { desc = 'Find' })
vim.keymap.set('n', '<leader>o', '', { desc = 'Open' })
vim.keymap.set('n', '<leader>t', '', { desc = 'Toggle' })
vim.keymap.set('n', '<C-b>', '', { desc = 'Buffer' })
vim.keymap.set('n', '<C-b>d', '<CMD>bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<C-b>D', '<CMD>%bdelete|edit #|bdelete #<CR>', { desc = 'Delete all buffers' })

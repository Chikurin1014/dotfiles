-- Leader key
vim.g.mapleader = ' '

-- Sub-leader keys
vim.keymap.set('n', '<leader>f', '', { desc = 'Find' })
vim.keymap.set('n', '<leader>o', '', { desc = 'Open' })
vim.keymap.set('n', '<leader>t', '', { desc = 'Toggle' })
vim.keymap.set('n', '<C-b>', '', { desc = 'Buffer' })

-- Buffer
vim.keymap.set('n', '<C-b>d', '<CMD>bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<C-b>D', '<CMD>%bdelete|edit #|bdelete #<CR>', { desc = 'Delete all buffers' })

-- Diagnostic
vim.keymap.set(
    'n',
    '<leader>td',
    function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    end,
    { desc = 'Toggle diagnostics' }
)
vim.keymap.set(
    'n',
    '<leader>tv',
    function()
        local old_vl = vim.diagnostic.config().virtual_lines
        local new_vl = false
        if type(old_vl) == 'boolean' and not old_vl then
            new_vl = { current_line = true }
        end
        vim.diagnostic.config({
            virtual_lines = new_vl
        })
    end,
    { desc = 'Toggle diagnostic virtual_lines' }
)
vim.keymap.set(
    'n',
    '<leader>ds',
    function() vim.diagnostic.open_float() end,
    { desc = 'Open diagnostic window' }
)
vim.keymap.set(
    'n',
    '<leader>dn',
    function() vim.diagnostic.jump({ count = 1 }) end,
    { desc = 'next diagnostic' }
)
vim.keymap.set(
    'n',
    '<leader>dN',
    function() vim.diagnostic.jump({ count = -1 }) end,
    { desc = 'previous diagnostic' }
)

-- Leader key
vim.g.mapleader = ' '

-- Sub-leader keys
vim.keymap.set('n', '<leader>f', '', { desc = 'Find' })
vim.keymap.set('n', '<leader>o', '', { desc = 'Open' })
vim.keymap.set('n', '<leader>t', '', { desc = 'Toggle' })

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
        -- `{ ... }` <-- toggle --> `false`
        local old_virtual_lines = vim.diagnostic.config().virtual_lines
        ---@type table | boolean
        local new_virtual_lines = false
        if type(old_virtual_lines) == 'boolean' and not old_virtual_lines then
            new_virtual_lines = { current_line = true }
        end
        vim.diagnostic.config {
            virtual_lines = new_virtual_lines
        }
    end,
    { desc = 'Toggle diagnostic virtual lines' }
)
vim.keymap.set(
    'n',
    '<leader><s-k>',
    function() vim.diagnostic.open_float() end,
    { desc = 'Open diagnostic window' }
)

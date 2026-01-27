return {
    {
        'folke/which-key.nvim',
        event = 'VimEnter',
        keys = {
            { '<F1>', '<cmd>WhichKey<cr>', mode = 'n', noremap = true, silent = true }
        },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            -- vim.keymap.set('n', '<F1>', '<cmd>WhichKey<cr>', { noremap = true, silent = true })
        end
    }
}

return {
    {
        "OXY2DEV/markview.nvim",
        -- Completion for `blink.cmp`
        dependencies = { "saghen/blink.cmp" },
        lazy = true,
        event = 'BufReadPost',
        keys = {
            { '<leader>tm', '<cmd>Markview<cr>', mode = 'n', desc = 'Toggle Markview' }
        },
        opts = {
            preview = { enable = true }
        }
    }
}

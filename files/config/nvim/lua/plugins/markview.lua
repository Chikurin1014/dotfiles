return {
    {
        "OXY2DEV/markview.nvim",
        event = 'VimEnter',
        -- Completion for `blink.cmp`
        dependencies = { "saghen/blink.cmp" },
        keys = {
            { '<leader>tm', '<cmd>Markview<cr>', mode = 'n', desc = 'Toggle Markview' }
        },
        config = function()
            require('markview').setup({
                preview = { enable = true }
            })
        end
    }
}

return {
    {
        'folke/which-key.nvim',
        lazy = true,
        event = { 'CursorHold' },
        cmd = { 'WhichKey' },
        keys = {
            { '<leader>' },
            {
                '<F1>',
                function()
                    require('which-key').show({ global = true })
                end,
                mode = 'n',
                noremap = true,
                silent = true
            }
        },
        opts = {
            preset = 'helix'
        },
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
}

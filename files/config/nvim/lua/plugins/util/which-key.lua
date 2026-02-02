return {
    {
        'folke/which-key.nvim',
        lazy = true,
        event = 'SafeState',
        opts = {
            preset = 'helix'
        },
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
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
}

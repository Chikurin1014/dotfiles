return {
    {
        'folke/which-key.nvim',
        lazy = true,
        event = 'VeryLazy',
        opts = {
            preset = 'helix'
        },
        cmd = { 'WhichKey' },
        keys = {
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

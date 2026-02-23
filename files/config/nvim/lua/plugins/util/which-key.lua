return {
    {
        'folke/which-key.nvim',
        lazy = true,
        event = { 'VeryLazy' },
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
        opts = {
            preset = 'helix'
        },
        init = function()
            vim.opt.timeout = true
            vim.opt.timeoutlen = 300
        end
    }
}

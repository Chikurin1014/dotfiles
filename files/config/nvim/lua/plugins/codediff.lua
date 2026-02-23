return {
    {
        'esmuellert/codediff.nvim',
        build = ':CodeDiff install',
        lazy = true,
        cmd = 'CodeDiff',
        keys = {
            { '<leader>d', '<cmd>CodeDiff<cr>', mode = 'n' },
        },
        opts = {
            explorer = {
                view_mode = 'tree',
            },
            history = {
                view_mode = 'tree',
            },
        },
    },
}

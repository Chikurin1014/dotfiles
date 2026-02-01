return {
    {
        'kevinhwang91/nvim-hlslens',
        lazy = true,
        keys = {
            {
                'n',
                [[<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>]],
                mode = 'n',
                noremap = true,
                silent = true
            },
            {
                'N',
                [[<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>]],
                mode = 'n',
                noremap = true,
                silent = true
            },
            {
                '*',
                [[*<cmd>lua require('hlslens').start()<cr>]],
                mode = 'n',
                noremap = true,
                silent = true
            },
            {
                '#',
                [[#<cmd>lua require('hlslens').start()<cr>]],
                mode = 'n',
                noremap = true,
                silent = true
            },
            {
                'g*',
                [[g*<cmd>lua require('hlslens').start()<cr>]],
                mode = 'n',
                noremap = true,
                silent = true
            },
            {
                'g#',
                [[g#<cmd>lua require('hlslens').start()<cr>]],
                mode = 'n',
                noremap = true,
                silent = true
            },
        },
        opts = {},
    }
}

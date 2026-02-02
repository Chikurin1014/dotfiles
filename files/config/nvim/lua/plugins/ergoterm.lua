return {
    {
        -- Experimentally using a forked plugin
        -- 'akinsho/toggleterm.nvim',
        'waiting-for-dev/ergoterm.nvim',
        lazy = true,
        cmd = {
            'TermNew',
            'TermSelect',
            'TermSend',
            'TermUpdate',
            'TermInspect',
            'TermToggleUniversalSelection',
        },
        keys = {
            { '<leader>ots', '<cmd>TermNew layout=below<cr>', mode = 'n', desc = 'Open new terminal (below)' },
            { '<leader>otv', '<cmd>TermNew layout=right<cr>', mode = 'n', desc = 'Open new terminal (right)' },
            { '<leader>otf', '<cmd>TermNew layout=float<cr>', mode = 'n', desc = 'Open new terminal (float)' },
            { '<leader>ott', '<cmd>TermNew layout=tab<cr>',   mode = 'n', desc = 'Open new terminal (tab)' },
            { '<leader>ote', '<cmd>TermSelect<cr>',           mode = 'n', desc = 'Open existing terminal' },
            {
                '<leader>og',
                '<cmd>TermNew layout=float cmd=lazygit name=git<cr>',
                mode = 'n',
                desc = 'Open git client',
            },
        },
        opts = {
            terminal_defaults = {
                shell = vim.g.shell,
            }
        },
    }
}

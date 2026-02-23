return {
    {
        'NeogitOrg/neogit',
        specs = {
            { 'nvim-lua/plenary.nvim', lazy = true },
        },
        lazy = true,
        cmd = 'Neogit',
        keys = {
            { '<leader>og', function() require('neogit').open({ kind = 'floating' }) end, desc = 'Open Neogit' },
        },
        opts = {
            kind = 'tab',
            use_default_keymaps = true,
            floating = {
                relative = 'editor',
                width = 0.9,
                height = 0.8,
                style = 'minimal',
                border = 'none',
            },
            signs = {
                hunk = { '', '' },
                item = { '', '' },
                section = { '', '' },
            },
            status = {
                show_head_commit_hash = true,
                recent_commit_count = 10,
                HEAD_padding = 10,
                HEAD_folded = false,
                mode_padding = 1,
                mode_text = {
                    M = ' ', -- modified
                    N = ' ', -- new fie
                    A = ' ', -- added
                    D = ' ', -- deleted
                    C = ' ', -- copied
                    U = ' ', -- updated
                    R = ' ', -- renamed
                    T = ' ', -- changed
                    DD = ' ', -- unmerged
                    AU = ' ', -- unmerged
                    UD = ' ', -- unmerged
                    UA = ' ', -- unmerged
                    DU = ' ', -- unmerged
                    AA = ' ', -- unmerged
                    UU = ' ', -- unmerged
                    ['?'] = ' ', -- untracked
                    ['!'] = ' ', -- ignored
                },
            },
            graph_style = 'ascii',
        },
    },
}

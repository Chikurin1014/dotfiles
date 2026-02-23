return {
    {
        'NeogitOrg/neogit',
        specs = {
            { 'nvim-lua/plenary.nvim',    lazy = true },
            { 'esmuellert/codediff.nvim', lazy = true },
            { 'folke/snacks.nvim',        lazy = true },
        },
        lazy = true,
        cmd = 'Neogit',
        keys = {
            { '<leader>og', function() require('neogit').open({ kind = 'floating' }) end, desc = 'Open Neogit' },
        },
        opts = {
            kind = 'tab',
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
            integrations = {
                codediff = true,
                snacks = true,
            },
        },
    },
}

return {
    {
        'nvimdev/dashboard-nvim',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        lazy = true,
        event = 'VimEnter',
        opts = {
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { key = 'p', desc = 'Plugins', group = 'Label', action = 'Lazy' },
                    { key = 'f', desc = 'File',    group = 'Label', action = 'Telescope find_files' },
                    {
                        key = 'e',
                        desc = 'Explorer',
                        group = 'Label',
                        action = function() require('fyler').open({ kind = 'float' }) end,
                    },
                    { key = 'g', desc = 'Git',  group = 'Label', action = 'LazyGit' },
                    { key = 'h', desc = 'Help', group = 'Label', action = 'Telescope help_tags' },
                    { key = 'q', desc = 'Quit', group = 'Label', action = 'qa' },
                },
                packages = { enable = true },
                footer = {},
            },
        },
    }
}

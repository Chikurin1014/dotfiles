return {
    {
        'nvimdev/dashboard-nvim',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        lazy = true,
        event = 'VimEnter',
        keys = {
            { '<leader>od', '<CMD>Dashboard<CR>', mode = 'n', desc = 'Open Dashboard' },
        },
        opts = {
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { key = 'P', desc = 'Plugins',  group = 'Label', action = 'Lazy' },
                    { key = 'F', desc = 'File',     group = 'Label', action = 'Telescope find_files' },
                    { key = 'E', desc = 'Explorer', group = 'Label', action = 'Fyler' },
                    { key = 'T', desc = 'Terminal', group = 'Label', action = 'TermNew layout=float' },
                    { key = 'H', desc = 'Help',     group = 'Label', action = 'Telescope help_tags' },
                    { key = 'Q', desc = 'Quit',     group = 'Label', action = 'qa' },
                },
                packages = { enable = true },
                project = { enable = true, limit = 3, action = 'ex ' },
                mru = { enable = true, limit = 5, cwd_only = false },
                footer = {},
                vertical_center = false,
            },
        },
    }
}

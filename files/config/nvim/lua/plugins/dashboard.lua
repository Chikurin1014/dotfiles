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
                    { key = 'P', desc = 'Plugins',  group = 'Label', action = 'Lazy' },
                    { key = 'F', desc = 'File',     group = 'Label', action = string.format('Telescope find_files cwd=%s', vim.g.home) },
                    { key = 'E', desc = 'Explorer', group = 'Label', action = string.format('Fyler %s', vim.g.home) },
                    { key = 'T', desc = 'Terminal', group = 'Label', action = string.format('TermNew layout=float dir=%s', vim.g.home) },
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

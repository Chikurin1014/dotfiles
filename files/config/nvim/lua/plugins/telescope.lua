return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'jonarrien/telescope-cmdline.nvim',
        },
        lazy = true,
        cmd = { 'Telescope' },
        keys = {
            { '<leader>ff', '<cmd>Telescope find_files<cr>', mode = 'n', desc = 'Find a file' },
            { '<leader>fr', '<cmd>Telescope oldfiles<cr>',   mode = 'n', desc = 'Find a recent file' },
            { '<leader>f/', '<cmd>Telescope live_grep<cr>',  mode = 'n', desc = 'Find a word (live grep)' },
            { '<leader>fb', '<cmd>Telescope buffers<cr>',    mode = 'n', desc = 'Find a buffer' },
            { '<leader>fh', '<cmd>Telescope help_tags<cr>',  mode = 'n', desc = 'Find a help' },
            { '<leader>ft', '<cmd>Telescope treesitter<cr>', mode = 'n', desc = 'Find a function, variable, etc.' },
            { '<leader>fn', '<cmd>Telescope fidget<cr>',     mode = 'n', desc = 'Find a notification' },
            { 'q:',         '<cmd>Telescope cmdline<cr>',    mode = 'n', desc = 'Telescope Cmdline' },
        },
        opts = {
            extensions = {
                fidget = {},
                cmdline = {},
            },
        },
        config = function(_, opts)
            local telescope = require('telescope')
            telescope.setup(opts)
            telescope.load_extension('fidget')
            telescope.load_extension('cmdline')
        end,
    },
}

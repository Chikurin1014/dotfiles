return {
    {
        'folke/flash.nvim',
        ---@type flash.config
        opts = {
            modes = {
                search = { enabled = false }
            }
        },
        lazy = true,
        keys = {
            { '<leader>jp', function() require('flash').jump() end,              mode = { 'n', 'x', 'o' }, desc = 'jump to pattern' },
            {
                '<leader>jw',
                function()
                    require('flash').jump({
                        search = { mode = 'search', max_length = 0 },
                        label = { after = { 0, 0 } },
                        pattern = '\\<',
                    })
                end,
                mode = { 'n', 'x', 'o' },
                desc = 'jump to word',
            },
            {
                '<leader>jl',
                function()
                    require('flash').jump({
                        search = { mode = 'search', max_length = 0 },
                        label = { after = { 0, 0 } },
                        pattern = '^',
                    })
                end,
                mode = { 'n', 'x', 'o' },
                desc = 'jump to line'
            },
            { '<leader>jt', function() require('flash').treesitter() end,        mode = { 'x', 'o' },      desc = 'Jump to Treesitter block' },
            { '<leader>jr', function() require('flash').remote() end,            mode = 'o',               desc = 'Remote Flash' },
            { '<leader>jR', function() require('flash').treesitter_search() end, mode = { 'x', 'o' },      desc = 'Treesitter Search' },
        },
    }
}

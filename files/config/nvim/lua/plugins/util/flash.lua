return {
    {
        'folke/flash.nvim',
        ---@type Flash.Config
        opts = {
            modes = {
                search = { enabled = true }
            }
        },
        lazy = true,
        keys = {
            { '/', desc = 'Search' },
            { '<leader>j',  function() require('flash').jump() end,              mode = { 'n', 'x', 'o' }, desc = 'Jump cursor' },
            { '<leader>v',  function() require('flash').treesitter() end,        mode = { 'n', 'x', 'o' }, desc = 'Select block' },
            { 'r',          function() require('flash').remote() end,            mode = 'o',               desc = 'Remote Flash' },
            { 'R',          function() require('flash').treesitter_search() end, mode = { 'o', 'x' },      desc = 'Treesitter Search' },
            { '<leader>tf', function() require('flash').toggle() end,            mode = { 'c' },           desc = 'Toggle Flash Search' },
        },
    }
}

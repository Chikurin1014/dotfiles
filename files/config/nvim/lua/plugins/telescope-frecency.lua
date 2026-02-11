return {
    {
        'nvim-telescope/telescope-frecency.nvim',
        -- install the latest stable version
        version = '*',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        lazy = true,
        cmd = 'Telescope',
        keys = {
            { '<leader>f' },
            { 'q' },
        },
        config = function()
            require('telescope').load_extension 'frecency'
        end,
    },
}

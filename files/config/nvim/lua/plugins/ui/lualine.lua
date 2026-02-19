return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = true,
        event = 'BufReadPost',
        opts = {
            options = {
                theme = 'iceberg',
                component_separators = '',
                section_separators = { left = '', right = '' },
                background = 'dark',
                disabled_filetypes = {
                    statusline = { 'dashboard' },
                },
                globalstatus = true,
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        },
        config = function(_, opts)
            require('mini.icons').mock_nvim_web_devicons()
            require('lualine').setup(opts)
        end,
    },
}

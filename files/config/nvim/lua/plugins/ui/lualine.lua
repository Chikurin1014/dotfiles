return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = true,
        specs = {
            { 'nvim-mini/mini.icons',         lazy = true },
            { 'meuter/lualine-so-fancy.nvim', lazy = true },
        },
        event = 'BufEnter',
        opts = {
            options = {
                theme = 'iceberg',
                component_separators = '',
                section_separators = { left = '', right = '' },
                background = 'dark',
                disabled_filetypes = {
                    statusline = { 'dashboard' },
                },
                always_show_tabline = false,
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'fancy_mode' },
                lualine_b = { { 'fancy_branch' }, { 'fancy_diff' }, { 'fancy_diagnostics' } },
                lualine_c = { { 'fancy_location' }, { 'fancy_cwd', substitute_home = true } },
                lualine_x = { { 'fancy_macro' }, { 'encoding' }, { 'fileformat' }, { 'fancy_filetype' } },
                lualine_y = { { 'fancy_lsp_servers' } },
                lualine_z = { { '"  " .. os.date("%H:%M")' } },
            },
            tabline = { lualine_z = { { 'tabs' } } },
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

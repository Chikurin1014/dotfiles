return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = true,
        specs = {
            { 'nvim-mini/mini.icons',         lazy = true },
            { 'meuter/lualine-so-fancy.nvim', lazy = true },
        },
        event = 'UIEnter',
        opts = {
            options = {
                theme = 'iceberg',
                component_separators = '',
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = { 'alpha', 'dashboard', 'snacks_dashboard' },
                },
                always_show_tabline = false,
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function(text)
                            local icons = {
                                ['NORMAL'] = '',
                                ['VISUAL'] = '',
                                ['INSERT'] = '󰗧',
                                ['TERMINAL'] = '',
                            }
                            return icons[text]
                                and icons[text]
                                or text:sub(1, 1)
                        end,
                    },
                },
                lualine_b = { { 'branch' }, { 'fancy_diff' }, { 'fancy_diagnostics' } },
                lualine_c = { { 'location', icon = ' ' }, { 'fancy_cwd', substitute_home = true } },
                lualine_x = { { 'fancy_macro' }, { 'encoding', padding = 0 }, { 'fileformat' }, { 'fancy_filetype', ts_icon = ' ' } },
                lualine_y = { { 'fancy_lsp_servers' } },
                lualine_z = { { 'datetime', style = '%H:%M', icon = ' ' } },
            },
            tabline = { lualine_z = { { 'tabs' } } },
            extensions = { 'mason', 'lazy' }
        },
        config = function(_, opts)
            require('mini.icons').mock_nvim_web_devicons()
            require('lualine').setup(opts)
        end,
    },
}

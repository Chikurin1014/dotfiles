return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = true,
        specs = {
            { 'nvim-mini/mini.icons', lazy = true },
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
                lualine_b = {
                    { 'branch' },
                    {
                        'diff',
                        colored = true,
                        symbols = {
                            added = ' ',
                            modified = ' ',
                            removed = ' ',
                        },
                    },
                    {
                        'diagnostics',
                        colored = true,
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                            hint = ' ',
                        },
                    },
                },
                lualine_c = {
                    { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
                    {
                        'filename',
                        path = 0,
                        padding = 0,
                        symbols = {
                            modified = ' ',
                            readonly = '󰏯 ',
                            unnamed = '',
                            newfile = ' ',
                        },
                    },
                    {
                        'filename',
                        path = 4,
                        color = 'lualine_c_inactive',
                        file_status = false,
                        fmt = function(text, _)
                            -- FIXME: using screen width but component width
                            return #text <= vim.opt.columns:get() * 0.4
                                and vim.fn.fnamemodify(text, ':h')
                                or nil
                        end,
                    },
                },
                lualine_x = {
                    { 'location', icon = '' },
                    { 'encoding', padding = 0 },
                    { 'fileformat' }
                },
                lualine_y = {
                    {
                        'lsp_status',
                        icon = ' ',
                        ignore_lsp = { 'copilot' },
                    },
                },
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

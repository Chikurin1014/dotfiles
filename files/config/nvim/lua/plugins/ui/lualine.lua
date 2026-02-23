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
                            if not text then return nil end
                            if text:match '.+://' then return text end

                            local root = vim.lsp.buf.list_workspace_folders()
                            root = root and root[1] or root -- if `root` is table, get the first element
                            -- fallback to default
                            local fname = vim.fn.fnamemodify(text, ':h:gs?\\?/?')
                            if root and #root > 0 then
                                local relpath = vim.fs.relpath(root, text)
                                if relpath then
                                    fname = vim.fn.fnamemodify(
                                        vim.fs.joinpath(vim.fn.fnamemodify(root, ':t'), relpath),
                                        ':h:gs?\\?/?')
                                end
                            end
                            -- FIXME: using screen width but section width
                            local width_ok = #fname <= vim.opt.columns:get() * 0.3
                            return width_ok and fname or nil
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

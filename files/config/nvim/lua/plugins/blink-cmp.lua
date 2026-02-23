return {
    {
        'saghen/blink.cmp',
        version = '1.*',
        specs = {
            { 'nvim-mini/mini.icons',      lazy = true },
            { 'xzbdmw/colorful-menu.nvim', lazy = true },
            -- wrapper of sources for nvim-cmp
            {
                'saghen/blink.compat', -- use v2.* for blink.cmp v1.*
                version = '2.*',
                lazy = true
            },
            -- sources
            { 'rafamadriz/friendly-snippets', lazy = true }, -- snippets
            { 'Kaiser-Yang/blink-cmp-git',    lazy = true }, -- git
        },
        lazy = true,
        event = { 'InsertEnter', 'CmdLineEnter' },

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'default',

                ['<C-u>'] = { 'scroll_documentation_up', 'scroll_signature_up', 'fallback' },
                ['<C-d>'] = { 'scroll_documentation_down', 'scroll_signature_down', 'fallback' },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                per_filetype = {
                    gitcommit = { inherit_defaults = true, 'git' },
                },
                providers = {
                    lsp = { async = true },
                    git = {
                        name = 'git',
                        module = 'blink-cmp-git',
                    },
                },
            },
            completion = {
                ghost_text = {
                    enabled = true,
                    show_with_menu = true,
                },
                list = { selection = { auto_insert = false } },
                menu = {
                    auto_show = true,
                    auto_show_delay_ms = function(_, _) return vim.api.nvim_get_mode().mode == 'c' and 500 or 0 end,
                    winblend = vim.opt.pumblend:get(),
                    draw = {
                        columns = { { 'kind_icon' }, { 'label', gap = 1 } },
                        components = {
                            label = {
                                text = function(ctx) return require('colorful-menu').blink_components_text(ctx) end,
                                highlight = function(ctx) return require('colorful-menu').blink_components_highlight(ctx) end,
                            },
                            kind_icon = {
                                text = function(ctx)
                                    local kind_icon, _, is_default = require('mini.icons').get('lsp', ctx.kind)
                                    return not is_default and kind_icon or ctx.kind_icon
                                end,
                                highlight = function(ctx)
                                    local _, hl, is_default = require('mini.icons').get('lsp', ctx.kind)
                                    return not is_default and hl or ctx.kind_hl
                                end,
                            },
                        },
                        treesitter = { 'lsp' },
                    },
                },
                documentation = {
                    auto_show = true,
                    treesitter_highlighting = true,
                    window = {
                        winblend = vim.opt.winblend:get(),
                    },
                },
            },
            signature = {
                enabled = true,
                window = {
                    winblend = vim.opt.winblend:get(),
                },
            },
            cmdline = {
                keymap = { preset = 'inherit' },
                list = {
                    selection = { preselect = true },
                },
                completion = {
                    menu = { auto_show = true },
                    ghost_text = { enabled = true },
                },
            },
            term = { enabled = true },
            fuzzy = { implementation = 'prefer_rust_with_warning' }
        },
        opts_extend = { 'sources.default' },
    },
}

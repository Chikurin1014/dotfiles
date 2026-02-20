return {
    opts = {
        undercurl = true,
        dimInactive = true,
        overrides = function(colors)
            local theme = colors.theme
            return {
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },

                -- Save an hlgroup with dark background and dimmed foreground
                -- so that you can use it where your still want darker windows.
                -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                -- Popular plugins that open floats will link to NormalFloat by default;
                -- set their background accordingly if you wish to keep them dark and borderless
                LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.opt.pumblend:get() },
                PmenuSel = { fg = 'none', bg = theme.ui.bg_p2, blend = vim.opt.pumblend:get() },
                PmenuSbar = { bg = theme.ui.bg_m1, blend = vim.opt.pumblend:get() },
                PmenuThumb = { bg = theme.ui.bg_p2, blend = vim.opt.pumblend:get() },
            }
        end,
        theme = 'dragon',
        background = {
            dark = 'dragon',
            light = 'lotus',
        },
    },
}

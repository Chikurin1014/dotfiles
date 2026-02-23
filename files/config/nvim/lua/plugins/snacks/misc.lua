return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        keys = {
            { '<leader>of', function() Snacks.explorer.open() end,   mode = 'n', desc = 'Open explorer-like picker' },
            { '<leader>ot', function() Snacks.terminal.open() end,   mode = 'n', desc = 'Open terminal window' },
            { '<leader>tt', function() Snacks.terminal.toggle() end, mode = 'n', desc = 'Toggle terminal window' },
            { '<leader>tz', function() Snacks.zen() end,             mode = 'n', desc = 'Toggle zen mode' },
        },
        opts = {
            bigfile = { enabled = true },
            explorer = { replace_netrw = false },
            image = { enabled = true },
            input = { enabled = true },
            quickfile = { enabled = true },
            scroll = { enabled = true },
            terminal = { shell = vim.g.shell },
            words = { enabled = true },
        },
        init = function()
            vim.api.nvim_create_autocmd('User', {
                pattern = 'VeryLazy',
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    -- Override print to use snacks for `:=` command
                    if vim.fn.has('nvim-0.11') == 1 then
                        vim._print = function(_, ...) dd(...) end
                    else
                        vim.print = _G.dd
                    end
                end,
            })
        end,
    },
}

local dashboard = require 'plugins.snacks.dashboard'
local notifier = require 'plugins.snacks.notifier'
local picker = require 'plugins.snacks.picker'

return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        specs = {
            { 'nvim-mini/mini.icons', lazy = true },
        },
        keys = vim.list_extend(vim.list_extend(
                {
                    { '<leader>of', function() Snacks.explorer.open() end,   mode = 'n', desc = 'Open explorer-like picker' },
                    { '<leader>og', function() Snacks.lazygit.open() end,    mode = 'n', desc = 'Open lazygit' },
                    { '<leader>ot', function() Snacks.terminal.open() end,   mode = 'n', desc = 'Open terminal window' },
                    { '<leader>tt', function() Snacks.terminal.toggle() end, mode = 'n', desc = 'Toggle terminal window' },
                    { '<leader>tz', function() Snacks.zen() end,             mode = 'n', desc = 'Toggle zen mode' },
                },
                dashboard.keys
            ),
            picker.keys
        ),
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = dashboard.opts,
            explorer = { replace_netrw = false },
            image = { enabled = true },
            input = { enabled = true },
            notifier = notifier.opts,
            picker = picker.opts,
            quickfile = { enabled = true },
            scroll = { enabled = true },
            terminal = { shell = vim.g.shell },
            words = { enabled = true },
        },
        init = function()
            vim.api.nvim_create_autocmd('User', {
                pattern = 'VeryLazy',
                callback = function()
                    notifier.init()

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

                    vim.api.nvim_create_autocmd('User', {
                        pattern = 'OilActionsPost',
                        callback = function(event)
                            if event.data.actions[1].type == 'move' then
                                Snacks.rename.on_rename_file(event.data.actions[1].src_url,
                                    event.data.actions[1].dest_url)
                            end
                        end,
                    })
                end,
            })
        end,
    },
    {
        'folke/edgy.nvim',
        optional = true,
        lazy = true,
        ---@module 'edgy'
        ---@param opts Edgy.Config
        opts = function(_, opts)
            for _, pos in ipairs({ 'top', 'bottom', 'left', 'right' }) do
                opts[pos] = opts[pos] or {}
                table.insert(opts[pos], {
                    ft = 'snacks_terminal',
                    size = { height = 0.4 },
                    title = '%{b:snacks_terminal.id}: %{b:term_title}',
                    filter = function(_, win)
                        return vim.w[win].snacks_win
                            and vim.w[win].snacks_win.position == pos
                            and vim.w[win].snacks_win.relative == 'editor'
                            and not vim.w[win].trouble_preview
                    end,
                })
            end
        end,
    },
    {
        'smjonas/inc-rename.nvim',
        opational = true,
        lazy = true,
        opts = { input_buffer_type = 'snacks' },
    },
}

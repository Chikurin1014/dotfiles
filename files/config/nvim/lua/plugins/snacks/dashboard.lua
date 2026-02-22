return {
    keys = {
        { '<leader>od', function() Snacks.dashboard.open({ win = 0 }) end, mode = 'n', desc = 'Open Dashboard' },
    },
    opts = {
        enabled = true,
        preset = {
            keys = {
                { icon = ' ', key = 'f', desc = 'Find File', action = function() Snacks.picker.files() end },
                { icon = ' ', key = 'n', desc = 'New File', action = '<cmd>ene | startinsert<cr>' },
                { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = '<cmd>Lazy<cr>' },
                { icon = ' ', key = 'q', desc = 'Quit', action = '<cmd>qa<cr>' },
            },
            header = [[

 █████╗██╗ ██╗ ██╗██████╗   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
██╔═══╝██║ ██║██╔╝██╔═══╝   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██║    ██████║╚═╝ ██████╗   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║    ██╔═██║    ╚═══██║   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
╚█████╗██║ ██║    ██████║   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚════╝╚═╝ ╚═╝    ╚═════╝   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        -- item field formatters
        formats = {
            icon = function(item)
                if item.file and item.icon == 'file' or item.icon == 'directory' then
                    return Snacks.dashboard.icon(item.file, item.icon)
                end
                return { item.icon, width = 2, hl = 'icon' }
            end,
            footer = { '%s', align = 'center' },
            header = { '%s', align = 'center' },
            file = function(item, ctx)
                local dir = vim.fn.fnamemodify(item.file, ':~:h:gs?\\?/?')
                local file = vim.fn.fnamemodify(item.file, ':t')
                if (#dir + #file + 2) > ctx.width then
                    -- truncate dir
                    local subdir = dir:match('^~/([^/]+)/')
                    dir = ('~/%s/……/'):format(subdir) .. vim.fn.fnamemodify(dir, ':t')
                end
                return dir and { { file, hl = 'file' }, { '  ' .. dir, hl = 'dir' } } or { { fname, hl = 'file' } }
            end,
        },
        sections = {
            { section = 'header', width = 80 },
            { section = 'keys', padding = 1 },
            { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
            { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
            { section = 'startup' },
        },
    },
}

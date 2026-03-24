return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        keys = {
            { '<leader>p', function() Snacks.picker() end,                 mode = 'n', desc = 'Find' },
            { '<leader>f', function() Snacks.picker.files() end,           mode = 'n', desc = 'Find file' },
            { '<leader>/', function() Snacks.picker.grep() end,            mode = 'n', desc = 'Find text (live grep)' },
            { '<leader>n', function() Snacks.picker.notifications() end,   mode = 'n', desc = 'Find notification' },
            { '<leader>"', function() Snacks.picker.registers() end,       mode = 'n', desc = 'Find register' },
            { '<leader>?', function() Snacks.picker.commands() end,        mode = 'n', desc = 'Find command' },
            { 'q:',        function() Snacks.picker.command_history() end, mode = 'n', desc = 'Command history' },
        },
        opts = {
            picker = {
                matcher = {
                    frecency = true,
                    cwd_bonus = true,
                },
                formatters = {
                    file = {
                        filename_first = true,
                    },
                },
                previewers = {
                    diff = {
                        style = 'fancy',
                        cmd = { 'difft --color=always --display=side-by-side' },
                    }
                },
            },
        },
    },
}

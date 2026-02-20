return {
    keys = {
        { '<leader>f',  function() Snacks.picker() end,                 mode = 'n', desc = 'Find' },
        { '<leader>ff', function() Snacks.picker.files() end,           mode = 'n', desc = 'Find file' },
        { '<leader>fg', function() Snacks.picker.grep() end,            mode = 'n', desc = 'Find text (live grep)' },
        { '<leader>fb', function() Snacks.picker.buffers() end,         mode = 'n', desc = 'Find buffer' },
        { '<leader>fh', function() Snacks.picker.help() end,            mode = 'n', desc = 'Find help' },
        { '<leader>ft', function() Snacks.picker.treesitter() end,      mode = 'n', desc = 'Find function, variable, etc.' },
        { '<leader>fn', function() Snacks.picker.notifications() end,   mode = 'n', desc = 'Find notification' },
        { '<leader>f"', function() Snacks.picker.registers() end,       mode = 'n', desc = 'Find register' },
        { '<leader>f:', function() Snacks.picker.commands() end,        mode = 'n', desc = 'Find command' },
        { 'q:',         function() Snacks.picker.command_history() end, mode = 'n', desc = 'Command history' },
    },
    opts = {
        enable = true,
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
}

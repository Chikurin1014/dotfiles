return {
    {
        'ahkohd/buffer-sticks.nvim',
        lazy = true,
        event = { 'BufReadPre' },
        keys = {
            { '<leader>b', function() BufferSticks.jump() end,   mode = 'n', desc = 'Buffer' },
            { '<leader>bc', function() BufferSticks.close() end,  mode = 'n', desc = 'Close to buffer' },
            { '<leader>tb', function() BufferSticks.toggle() end, mode = 'n', desc = 'Toggle BufferSticks' },
        },
        opts = {
            offset = { x = 1, y = 0, },
            active_char = '━━', -- Character for active buffer
            inactive_char = ' ━', -- Character for inactive buffers
            alternate_char = ' ━', -- Character for alternate buffer
            active_modified_char = '━━', -- Character for active modified buffer (unsaved changes)
            inactive_modified_char = ' ━', -- Character for inactive modified buffers (unsaved changes)
            alternate_modified_char = ' ━', -- Character for alternate modified buffer (unsaved changes)
            transparent = true,
            highlights = {
                active = { link = 'Statement' },
                alternate = { link = 'StorageClass' },
                inactive = { link = 'Whitespace' },
                active_modified = { link = 'Constant' },
                alternate_modified = { link = 'Constant' },
                inactive_modified = { link = 'Constant' },
                label = { link = 'Comment' },
                filter_selected = { link = 'Statement' },
                filter_title = { link = 'Comment' },
                list_selected = { link = 'Statement' },
            },
        },
        config = function(_, opts)
            local sticks = require 'buffer-sticks'
            sticks.setup(opts)
            sticks.show()
        end,
    },
}

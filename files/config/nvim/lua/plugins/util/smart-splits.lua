return {
    {
        'mrjones2014/smart-splits.nvim',
        lazy = false, -- In order to integrate with WezTerm
        keys = {
            -- resizing splits
            -- these keymaps will also accept a range,
            -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
            { '<A-h>',      function() require('smart-splits').resize_left() end },
            { '<A-j>',      function() require('smart-splits').resize_down() end },
            { '<A-k>',      function() require('smart-splits').resize_up() end },
            { '<A-l>',      function() require('smart-splits').resize_right() end },
            -- moving between splits
            { '<C-h>',      function() require('smart-splits').move_cursor_left() end },
            { '<C-j>',      function() require('smart-splits').move_cursor_down() end },
            { '<C-k>',      function() require('smart-splits').move_cursor_up() end },
            { '<C-l>',      function() require('smart-splits').move_cursor_right() end },
            { '<C-\\>',     function() require('smart-splits').move_cursor_previous() end },
            -- swapping buffers between windows
            { '<leader>bh', function() require('smart-splits').swap_buf_left() end },
            { '<leader>bj', function() require('smart-splits').swap_buf_down() end },
            { '<leader>bk', function() require('smart-splits').swap_buf_up() end },
            { '<leader>bl', function() require('smart-splits').swap_buf_right() end },
        },
        opts = {
            ignored_filetypes = { 'fyler' },
        },
        config = function(_, opts)
            require('smart-splits').setup(opts)
        end,
    },
}

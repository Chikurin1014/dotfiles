return {
    'smoka7/hop.nvim',
    event = 'BufRead',
    version = '*',
    opts = {
        multi_windows = true,
    },
    keys = {
        { '<leader>hw', '<cmd>HopWord<CR>',               mode = { 'n', 'v', 'o' }, desc = 'Hop Word' },
        { '<leader>hl', '<cmd>HopLine<CR>',               mode = { 'n', 'v', 'o' }, desc = 'Hop Line' },
        { '<leader>hp', '<cmd>HopPattern<CR>',            mode = { 'n', 'v', 'o' }, desc = 'Hop Pattern' },
        { 'f',          '<cmd>HopChar1CurrentLineAC<CR>', mode = { 'n', 'v', 'o' }, desc = 'Hop Char in Line (After Cursor)' },
        { 'F',          '<cmd>HopChar1CurrentLineBC<CR>', mode = { 'n', 'v', 'o' }, desc = 'Hop Char in Line (Before Cursor)' },
        {
            't',
            '<cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>',
            mode = { 'n', 'v', 'o' },
            desc = 'Hop Before Char in Line (After Cursor)',
        },
        {
            'T',
            '<cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>',
            mode = { 'n', 'v', 'o' },
            desc = 'Hop After Char in Line (Before Cursor)',
        },
    },
}

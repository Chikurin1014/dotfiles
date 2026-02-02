return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        lazy = true,
        event = 'BufCreate',
        config = function()
            vim.opt.termguicolors = true
            local bufferline = require('bufferline')
            bufferline.setup({
                options = {
                    mode = 'buffers',
                    style_preset = bufferline.style_preset.default,
                    themable = true,
                    numbers = 'none',
                    color_icons = true,
                    separator_style = 'slant'
                },
            })
            vim.keymap.set('n', '<leader>b', '', { desc = 'Buffer' })
            vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCyclePrev<cr>',
                { noremap = true, silent = true, desc = 'Go to Prev' })
            vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCycleNext<cr>',
                { noremap = true, silent = true, desc = 'Go to Next' })
            vim.keymap.set('n', '<leader>bs', '<cmd>BufferLinePick<cr>',
                { noremap = true, silent = true, desc = 'Go to Specific' })
            vim.keymap.set('n', '<leader>bc', '', { desc = 'Close buffers' })
            vim.keymap.set('n', '<leader>bca', '<cmd>BufferLineCloseOthers<cr>',
                { noremap = true, silent = true, desc = 'Close All others' })
            vim.keymap.set('n', '<leader>bcs', '<cmd>BufferLinePickClose<cr>',
                { noremap = true, silent = true, desc = 'Close Specific' })
            vim.keymap.set('n', '<leader>bch', '<cmd>BufferLineCloseLeft<cr>',
                { noremap = true, silent = true, desc = 'Close Prev' })
            vim.keymap.set('n', '<leader>bcl', '<cmd>BufferLineCloseRight<cr>',
                { noremap = true, silent = true, desc = 'Close Next' })
        end
    }
}

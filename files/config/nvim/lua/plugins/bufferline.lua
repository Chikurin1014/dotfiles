return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            local bufferline = require('bufferline')
            bufferline.setup {
                options = {
                    mode = 'buffers',
                    style_preset = bufferline.style_preset.default,
                    numbers = 'none',
                    color_icons = true,
                    separator_style = 'slant'
                },
            }
            vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true, desc = 'Go to Next' })
            vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true, desc = 'Go to Prev' })
            vim.keymap.set('n', '<leader>bs', '<cmd>BufferLinePick<cr>', { noremap = true, silent = true, desc = 'Go to Specific' })
            vim.keymap.set('n', '<leader>wa', '<cmd>BufferLineCloseOthers<cr>', { noremap = true, silent = true, desc = 'Close All others' })
            vim.keymap.set('n', '<leader>ws', '<cmd>BufferLinePickClose<cr>', { noremap = true, silent = true, desc = 'Close Specific' })
            vim.keymap.set('n', '<leader>wn', '<cmd>BufferLineCloseRight<cr>', { noremap = true, silent = true, desc = 'Close Next' })
            vim.keymap.set('n', '<leader>wp', '<cmd>BufferLineCloseLeft<cr>', { noremap = true, silent = true, desc = 'Close Prev' })
        end
    }
}

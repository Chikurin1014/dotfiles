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
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
            map('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>', opts)
            map('n', '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', opts)
            map('n', '<leader>bs', '<cmd>BufferLinePick<cr>', opts)
            map('n', '<leader>wa', '<cmd>BufferLineCloseOthers<cr>', opts)
            map('n', '<leader>ws', '<cmd>BufferLinePickClose<cr>', opts)
            map('n', '<leader>wn', '<cmd>BufferLineCloseRight<cr>', opts)
            map('n', '<leader>wp', '<cmd>BufferLineCloseLeft<cr>', opts)
        end
    }
}


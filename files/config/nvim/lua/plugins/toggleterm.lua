return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        keys = {
            { '<leader>ot', mode = 'n', desc = 'Open Terminal' },
            { '<esc>', mode = 't', desc = 'Close Terminal' }
        },
        config = function()
            local shell = 'zsh'
            local map = vim.api.nvim_set_keymap
            local Terminal = require('toggleterm.terminal').Terminal
            local sh = Terminal:new({ cmd = shell .. ' -l', hidden = true, direction = 'float' })
            function _sh_toggle()
                sh:toggle()
            end
            vim.keymap.set('n', '<leader>ot', _sh_toggle)
            vim.keymap.set('t', '<esc>', _sh_toggle)
        end
    }
}

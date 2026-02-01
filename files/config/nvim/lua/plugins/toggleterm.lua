return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        lazy = true,
        keys = {
            { '<leader>ot', mode = 'n', desc = 'Open Terminal' },
            { '<esc>', mode = 't', desc = 'Close Terminal' }
        },
        config = function()
            local shell = 'zsh'
            local map = vim.api.nvim_set_keymap
            local Terminal = require('toggleterm.terminal').Terminal
            local zsh = Terminal:new({ cmd = shell .. ' -l', hidden = true, direction = 'float' })
            function _sh_toggle()
                zsh:toggle()
            end
            vim.keymap.set('n', '<leader>ot', _sh_toggle)
            vim.keymap.set('t', '<esc>', _sh_toggle)
        end
    }
}

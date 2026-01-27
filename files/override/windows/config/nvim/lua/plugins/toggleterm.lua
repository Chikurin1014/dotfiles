return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        keys = {
            { '<C-t>', mode = 'n', desc = 'Toggle Terminal' },
            { '<C-t>', mode = 't', desc = 'Toggle Terminal' }
        },
        opts = {},
        config = function()
            local shell = 'nu'
            local map = vim.api.nvim_set_keymap
            local Terminal = require('toggleterm.terminal').Terminal
            local sh = Terminal:new({ cmd = shell .. ' -l', hidden = true, direction = 'float' })
            function _sh_toggle()
                sh:toggle()
            end
            vim.keymap.set('n', '<C-t>', _sh_toggle)
            vim.keymap.set('t', '<C-t>', _sh_toggle)
        end
    }
}

return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {},
        config = function()
            local shell = 'zsh'
            local map = vim.api.nvim_set_keymap
            local Terminal = require('toggleterm.terminal').Terminal
            local sh = Terminal:new({ cmd = shell .. ' -l', hidden = true, direction = 'float' })
            function _sh_toggle()
                sh:toggle()
            end
            vim.keymap.set('n', '<leader>tt', _sh_toggle, { desc = 'Toggle Terminal' })
        end
    }
}

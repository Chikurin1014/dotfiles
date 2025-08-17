return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {},
        config = function()
            local shell = 'zsh'
            local map = vim.api.nvim_set_keymap
            local opts = {}
            local Terminal = require('toggleterm.terminal').Terminal
            local sh = Terminal:new({ cmd = shell .. ' -l', hidden = true, direction = 'float' })
            function _sh_toggle()
                sh:toggle()
            end
            map('n', '<leader>t', '<CMD>lua _sh_toggle()<CR>', opts)
        end
    }
}

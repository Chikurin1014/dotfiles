return {
    {
        'is0n/fm-nvim',
        config = function()
            require('fm-nvim').setup({
                default = 'float',

                float = {
                    border = 'none',
                    width = 0.8, -- Width of the floating window
                    height = 0.8, -- Height of the floating window
                },
                split = {
                    direction = 'vertical', -- 'horizontal' or 'vertical'
                    size = 30, -- Size of the split window
                },
            })
        end,
        keys = {
            { '<leader>git', '<cmd>Lazygit<cr>', desc = 'Lazygit' }
        }
    }
}
return {
    {
        'is0n/fm-nvim',
        keys = {
            { '<leader>g', '<cmd>Lazygit<cr>', desc = 'Git' }
        },
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
        end
    }
}

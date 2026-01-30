return {
    {
        "karb94/neoscroll.nvim",
        opts = {},
        config = function()
            require('neoscroll').setup({
                mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>'}
            })
        end
    }
}

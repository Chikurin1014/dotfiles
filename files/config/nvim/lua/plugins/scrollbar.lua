return {
    {
        'petertriho/nvim-scrollbar',
        event = 'UIEnter',
        config = function()
            require('scrollbar').setup()
        end
    }
}

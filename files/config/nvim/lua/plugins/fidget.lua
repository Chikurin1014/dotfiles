return {
    {
        "j-hui/fidget.nvim",
        lazy = true,
        event = 'VeryLazy',
        opts = {
            window = {
                normal_hl = 'FloatFooter',
            },
            notification = {
                override_vim_notify = true,
            }
        },
    },
}

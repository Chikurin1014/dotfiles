return {
    {
        'nvim-mini/mini.trailspace',
        lazy = true,
        event = 'BufReadPost',
        opts = {
            only_in_normal_buffers = true,
        },
    },
}

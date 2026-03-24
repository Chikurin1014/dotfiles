return {
    {
        'nvim-mini/mini.indentscope',
        lazy = true,
        event = 'BufReadPost',
        opts = {
            -- disable all
            mappings = {
                object_scope = '',
                object_scope_with_border = '',
                goto_top = '',
                goto_bottom = '',
            },
        },
    },
}

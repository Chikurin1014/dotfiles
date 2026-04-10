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
        config = function(_, opts)
            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('MiniIndentscope', {}),
                pattern = { 'alpha', 'dashboard', 'snacks_dashboard' },
                callback = function(args)
                    vim.b[args.buf].miniindentscope_disable = true
                end
            })
            require('mini.indentscope').setup(opts)
        end,
    },
}

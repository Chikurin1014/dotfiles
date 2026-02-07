vim.lsp.config('*', {
    root_markers = { '.git/' },
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'Go to definition' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf, desc = 'Go to declaration' })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf, desc = 'Go to references' })
    end,
})

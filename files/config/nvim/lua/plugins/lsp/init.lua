-- Some LSP is not supported with the latest API (see: https://github.com/neovim/nvim-lspconfig/issues/3705)
local servers = {
    'bashls',
    'clangd',
    'dockerls',
    'jsonls',
    'lua_ls',
    'remark_ls',
    'pyright',
    'rust_analyzer',
    'taplo',
    'yamlls',
    'zls',
}

return {
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
            'simrat39/rust-tools.nvim' -- for rust_analyzer
        },
        lazy = true,
        event = 'BufReadPre',
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
            "MasonUpdate",
        },
        opts = {
            ensure_installed = servers
        },
        config = function(_, opts)
            require('mason').setup()
            require('mason-lspconfig').setup(opts)

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(event)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = event.buf, desc = 'Go to definition' })
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'Go to declaration' })
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = event.buf, desc = 'Go to references' })
                end,
            })
        end
    }
}

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
        opts = {
            ensure_installed = servers
        },
        config = function(_, opts)
            require('mason').setup()
            require('mason-lspconfig').setup(opts)
        end
    }
}

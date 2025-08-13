return {
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'bashls',
                    'clangd',
                    'dockerls',
                    'jsonls',
                    'remark_ls',
                    'pyright',
                    'rust_analyzer',
                    'taplo',
                    'yamlls',
                    'zls',
                },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                    ['rust_analyzer'] = function()
                        require('rust-tools').setup()
                    end,
                }
            })
        end
    }
}


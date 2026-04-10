return {
    {
        'williamboman/mason-lspconfig.nvim',
        specs = {
            {
                'williamboman/mason.nvim',
                lazy = true,
                cmd = {
                    "Mason",
                    "MasonInstall",
                    "MasonUninstall",
                    "MasonUninstallAll",
                    "MasonUpdate",
                    "MasonLog",
                },
                config = true,
            },
        },
        dependencies = {
            'neovim/nvim-lspconfig',
        },
        lazy = true,
        event = 'FileType',
        opts = {
            -- Some LSP is not supported with the latest API
            -- See: https://github.com/neovim/nvim-lspconfig/issues/3705
            ensure_installed = {
                'bashls',
                'copilot',
                'jsonls',
                'lua_ls',
                'marksman',
                'pyright',
                'taplo',
                'yamlls',
            },
        },
    },
}

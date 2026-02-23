return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = ':TSUpdate',
        lazy = false,
        config = function()
            local treesitter = require 'nvim-treesitter'
            local languages = {
                'bash',
                'diff',
                'dockerfile',
                'git_config',
                'git_rebase',
                'gitattributes',
                'gitcommit',
                'gitignore',
                'json',
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'nix',
                'nu',
                'python',
                'rust',
                'toml',
                'xml',
                'yaml',
                'zsh'
            }

            treesitter.setup {
                install_dir = vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')
            }
            treesitter.install(languages)

            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = false }),
                pattern = languages,
                callback = function()
                    vim.treesitter.start()

                    -- Treesitter-based folding
                    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo[0][0].foldmethod = 'expr'

                    -- Treesitter-based indentation
                    vim.bo.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
                end
            })
        end,
    },
}

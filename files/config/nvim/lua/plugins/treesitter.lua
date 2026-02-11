return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = ':TSUpdate',
        -- To avoid conflicts with markview
        -- See: https://github.com/OXY2DEV/markview.nvim/issues/365
        dependencies = { 'OXY2DEV/markview.nvim' },
        lazy = true,
        event = 'BufReadPre',
        config = function()
            local nvim_treesitter = require('nvim-treesitter')
            local languages = {
                'bash',
                'bibtex',
                'c',
                'cpp',
                'cmake',
                'comment',
                'css',
                'diff',
                'dockerfile',
                'doxygen',
                'editorconfig',
                'elixir',
                'git_config',
                'git_rebase',
                'gitattributes',
                'gitcommit',
                'gitignore',
                'haskell',
                'html',
                'ini',
                'javascript',
                'json',
                'latex',
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'nix',
                'nu',
                'python',
                'regex',
                'rust',
                'ssh_config',
                'toml',
                'tsx',
                'typescript',
                'typst',
                'udev',
                'xml',
                'yaml',
                'zig',
                'zsh'
            }

            nvim_treesitter.setup({
                install_dir = vim.fs.joinpath(vim.fn.stdpath('data'), 'site')
            })
            nvim_treesitter.install(languages)

            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true }),
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
        end
    }
}

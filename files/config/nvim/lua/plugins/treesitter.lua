return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'main',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            treesitter = require('nvim-treesitter')
            treesitter.setup()
            treesitter.install({
                'arduino',
                'bash',
                'bibtex',
                'c',
                'cmake',
                'cpp',
                'css',
                'csv',
                'diff',
                'dockerfile',
                'doxygen',
                'git_config',
                'gitignore',
                'haskell',
                'javascript',
                'json',
                'latex',
                'lua',
                'matlab',
                'powershell',
                'python',
                'rust',
                'toml',
                'yaml',
                'zig'
            })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'lua' },
                callback = function()
                    -- syntax highlighting, provided by Neovim
                    vim.treesitter.start()
                    -- folds, provided by Neovim
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    -- indentation, provided by nvim-treesitter
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end
    }
}

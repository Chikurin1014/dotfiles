return {
    {
        'pwntester/octo.nvim',
        specs = {
            { 'nvim-lua/plenary.nvim', lazy = true },
            { 'folke/snacks.nvim',     lazy = true },
            { 'nvim-mini/mini.icons',  lazy = true },
        },
        cmd = 'Octo',
        keys = {
            { '<leader>oo', '<cmd>Octo<cr>', mode = 'n', desc = 'Octo - GitHub' }
        },
        opts = {
            -- or 'fzf-lua' or 'snacks' or 'default'
            picker = 'snacks',
            -- bare Octo command opens picker of commands
            enable_builtin = true,
        },
        config = function(_, opts)
            require('mini.icons').mock_nvim_web_devicons()
            require('octo').setup(opts)
        end
    },
}

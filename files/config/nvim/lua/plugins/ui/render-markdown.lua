return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
        lazy = true,
        ft = { 'markdown', 'quarto' },
        cmd = { 'RenderMarkdown' },
        keys = {
            { '<leader>tm', '<cmd>RenderMarkdown toggle<cr>', mode = 'n', desc = 'Toggle RenderMarkdown' },
        },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            enabled = true,
            render_modes = { 'n', 'c', 't' },
            completions = { lsp = { enabled = true } },
        },
    },
}

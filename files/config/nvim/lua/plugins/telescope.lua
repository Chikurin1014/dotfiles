return {
    { 'nvim-lua/plenary.nvim',                   lazy = true },
    { 'nvim-telescope/telescope-frecency.nvim',  lazy = true },
    { 'nvim-telescope/telescope-ui-select.nvim', lazy = true },
    { 'jonarrien/telescope-cmdline.nvim',        lazy = true },
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        cmd = { 'Telescope' },
        keys = {
            { '<leader>f' },
            { 'q' },
            { '<leader>ff', '<cmd>Telescope find_files<cr>',                mode = 'n', desc = 'Find a file' },
            { '<leader>fr', '<cmd>Telescope frecency<cr>',                  mode = 'n', desc = 'Find a recent file' },
            { '<leader>f/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', mode = 'n', desc = 'Find a word (current buffer)' },
            { '<leader>fg', '<cmd>Telescope live_grep<cr>',                 mode = 'n', desc = 'Find a word (live grep)' },
            { '<leader>fb', '<cmd>Telescope buffers<cr>',                   mode = 'n', desc = 'Find a buffer' },
            { '<leader>fh', '<cmd>Telescope help_tags<cr>',                 mode = 'n', desc = 'Find a help' },
            { '<leader>ft', '<cmd>Telescope treesitter<cr>',                mode = 'n', desc = 'Find a function, variable, etc.' },
            { '<leader>fn', '<cmd>Telescope fidget<cr>',                    mode = 'n', desc = 'Find a notification' },
            { 'q:',         '<cmd>Telescope cmdline<cr>',                   mode = 'n', desc = 'Telescope Cmdline' },
        },
        opts = {
            defaults = {
                layout_strategy = 'flex',
                layout_config = {
                    prompt_position = 'top',
                },
                sorting_strategy = 'ascending',
            },
            extensions = {
                frecency = {},
                fidget = {},
                ["ui-select"] = {
                    require("telescope.themes").get_cursor {},
                },
                cmdline = {},
            },
        },
    },
}

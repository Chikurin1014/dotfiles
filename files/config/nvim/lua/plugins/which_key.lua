return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
            map('n', '<F1>', '<cmd>WhichKey<cr>', opts)
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    }
}

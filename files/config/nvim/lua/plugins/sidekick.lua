return {
    {
        "folke/sidekick.nvim",
        lazy = true,
        cmd = 'Sidekick',
        opts = {
            cli = {
                mux = { enabled = vim.g.is_unix },
            },
        },
    },
}

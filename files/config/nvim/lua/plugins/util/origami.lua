return {
    {
        "chrisgrieser/nvim-origami",
        lazy = true,
        event = "BufReadPost",
        opts = {
            autoFold = {
                enable = false,
            },
            foldKeymaps = {
                closeOnlyOnFirstColumn = true,
                scrollLeftOnCaret = true,
            },
        }, -- needed even when using default config

        -- recommended: disable vim's auto-folding
        init = function()
            vim.opt.foldlevel = 99
            vim.opt.foldlevelstart = 99
        end,
    }
}

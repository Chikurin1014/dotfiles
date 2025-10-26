return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        event = { "BufNewFile", "BufReadPre" },
    }
}

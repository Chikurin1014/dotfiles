return {
    {
        'smjonas/inc-rename.nvim',
        lazy = true,
        cmd = 'IncRename',
        keys = {
            { 'grn', ':IncRename ', mode = 'n', desc = 'rename symbol' }
        },
        config = true,
    }
}

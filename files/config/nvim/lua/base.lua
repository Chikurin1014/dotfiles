-- Enable config cache
vim.loader.enable()

-- Global variables
vim.g.is_unix = package.config:sub(1, 1) == '/'
vim.g.shell = vim.g.is_unix and 'fish' or 'nu'
vim.g.default_colorscheme = 'kanagawa'

vim.opt.backup = false
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.scrolloff = 5
vim.opt.helplang = { 'ja', 'en' }
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.cmdheight = 0
vim.opt.winblend = 10
vim.opt.pumblend = 5

vim.diagnostic.config {
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        },
    },
    virtual_text = false,
    virtual_lines = { current_line = true },
    float = { source = true },
}

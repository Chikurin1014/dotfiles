vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Enable config cache
vim.loader.enable()

-- Global variables
vim.g.is_unix = package.config:sub(1, 1) == '/'
vim.g.shell = vim.g.is_unix and 'zsh' or 'nu'

-- To avoid conflicts with treesitter
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.helplang = { 'ja', 'en' }
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.splitright = true

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})

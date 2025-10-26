vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.wo.number = true
vim.wo.relativenumber = false
vim.opt.mouse = 'a' --マウス操作を有効化
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.helplang = 'ja', 'en'
vim.opt.updatetime = 300
vim.opt.showtabline = 2
vim.opt.clipboard = 'unnamedplus' --クリップボードとレジスタを共有
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes' --行数表示の横に余白を追加
vim.opt.hidden = true
vim.opt.swapfile = false --スワップファイルを生成しない
vim.opt.wrap = false --端までコードが届いた際に折り返さない

-- float-transparent
vim.opt.winblend = 5 --フロートウィンドウなどを若干透明に

-- keymap
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>t', '', { desc = 'Toggle' })
vim.keymap.set('n', '<leader>w', '<C-w>', { noremap = true, desc = 'Window' })

vim.keymap.set('n', '<leader>wh', '<C-w>h', { noremap = true, desc = 'Go to the left window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { noremap = true, desc = 'Go to the down window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { noremap = true, desc = 'Go to the up window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { noremap = true, desc = 'Go to the right window' })
vim.keymap.set('n', '<leader>wH', '<C-w>H', { noremap = true, desc = 'Move window to far left' })
vim.keymap.set('n', '<leader>wJ', '<C-w>J', { noremap = true, desc = 'Move window to far bottom' })
vim.keymap.set('n', '<leader>wK', '<C-w>K', { noremap = true, desc = 'Move window to far top' })
vim.keymap.set('n', '<leader>wL', '<C-w>L', { noremap = true, desc = 'Move window to far right' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { noremap = true, desc = 'Close all other windows' })

-- Python3
vim.cmd([[
    let g:python3_host_prog = '/usr/bin/python3'
]])

require('lazy-nvim').setup {
    pre_load_hook = function()
        require('base')
        require('keymaps')
        require('lsp')
        if vim.g.neovide then
            require('neovide')
        end
    end,
}

lsps = {
    'bashls',
    'emmylua_ls',
    'fish_lsp',
    'taplo',
    'jsonls',
    'yamlls'
}
for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
end

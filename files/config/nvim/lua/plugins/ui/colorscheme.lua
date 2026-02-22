local function import_theme(plugin, mod, options)
    if not options then options = {} end
    local theme = options.theme or mod
    local is_default = theme == vim.g.default_colorscheme
    local ok, specs = pcall(require, 'plugins.ui.themes.' .. theme)
    if not ok then
        specs = {}
    end
    return {
        plugin,
        enabled = options.enabled or specs.enabled or is_default,
        lazy = true,
        event = is_default and { 'UIEnter' } or { 'ColorSchemePre', 'CursorHold' },
        opts = vim.tbl_deep_extend('force', specs.opts or {}, options.opts or {}),
        config = specs.config
            or function(_, opts)
                require(specs.main or mod).setup(opts)
                if is_default then
                    vim.cmd.colorscheme(theme)
                end
            end,
    }
end

return {
    import_theme('rebelot/kanagawa.nvim', 'kanagawa', { enabled = true }),
    import_theme('EdenEast/nightfox.nvim', 'nightfox', { enabled = true }),
}

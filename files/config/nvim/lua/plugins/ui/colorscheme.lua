local function import_theme(plugin, mod, options)
    if not options then options = {} end
    local theme = options.theme and options.theme or mod
    local ok, specs = pcall(require, 'plugins.ui.themes.' .. theme)
    if not ok then
        specs = {}
    end
    local enabled = options.enabled and options.enabled
        or specs.enabled and specs.enabled
        or theme == vim.g.default_colorscheme
    local config = specs.config and specs.config or function(_, opts)
        require(specs.main and specs.main or mod).setup(opts)
        if theme == vim.g.default_colorscheme then
            vim.cmd.colorscheme(theme)
        end
    end
    return {
        plugin,
        enabled = enabled,
        lazy = true,
        event = 'UIEnter',
        opts = specs.opts and specs.opts or {},
        config = config,
    }
end

return {
    import_theme('rebelot/kanagawa.nvim', 'kanagawa', { enabled = true }),
    import_theme('EdenEast/nightfox.nvim', 'nightfox', { enabled = true }),
}

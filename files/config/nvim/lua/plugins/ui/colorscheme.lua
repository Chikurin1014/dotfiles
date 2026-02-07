local function import_theme(plugin, mod, theme)
    local th = theme and theme or mod
    local ok, specs = pcall(require, 'plugins.ui.themes.' .. th)
    if not ok then
        specs = {}
    end
    local enabled = th == vim.g.default_colorscheme
    local opts = specs.opts and specs.opts or {}
    local config = specs.config and specs.config or function(_, opts)
        require(specs.main and specs.main or mod).setup(opts)
        vim.cmd.colorscheme(th)
    end
    return {
        plugin,
        enabled = enabled,
        lazy = true,
        event = 'UIEnter',
        opts = opts,
        config = config,
    }
end

return {
    import_theme('rebelot/kanagawa.nvim', 'kanagawa'),
    import_theme('EdenEast/nightfox.nvim', 'nightfox'),
}

local setup = function(opts)
    local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable', -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    if opts and opts.pre_load_callback and type(opts.pre_load_callback) == 'function' then
        opts.pre_load_callback()
    end

    require('lazy').setup({
        spec = {
            { import = 'plugins' },
            { import = 'plugins.ui' },
            { import = 'plugins.util' }
        }
    })
end

return {
    setup = setup,
}

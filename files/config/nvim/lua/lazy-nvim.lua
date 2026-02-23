return {
    setup = function(opts)
        local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
        if not vim.loop.fs_stat(lazypath) then
            vim.fn.system {
                'git',
                'clone',
                '--filter=blob:none',
                'https://github.com/folke/lazy.nvim.git',
                '--branch=stable', -- latest stable release
                lazypath,
            }
        end
        vim.opt.rtp:prepend(lazypath)

        if opts and opts.pre_load_hook and type(opts.pre_load_hook) == 'function' then
            opts.pre_load_hook()
        end

        require('lazy').setup {
            spec = {
                { import = 'plugins' },
                { import = 'plugins.snacks' },
                { import = 'plugins.treesitter' },
                { import = 'plugins.ui' },
                { import = 'plugins.util' }
            },
            pkg = {
                sources = { 'lazy', 'rockspec', 'packspec' },
            },
            rocks = { enabled = true },
        }
    end,
}

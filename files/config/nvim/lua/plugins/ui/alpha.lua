return {
    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            local alpha = require('alpha')
            local dashboard = require('alpha.themes.dashboard')

            local header_art_path = vim.fs.joinpath(vim.fn.stdpath('config'), 'dashboard.txt')
            if vim.fn.filereadable(header_art_path) == 1 then
                dashboard.section.header.val = vim.fn.readfile(header_art_path)
            end

            dashboard.section.buttons.val = {
                dashboard.button('n', 'New file', '<cmd>ene<BAR>startinsert<cr>'),
                dashboard.button('o', 'Open a file', '<cmd>lua require("telescope.builtin").find_files()<cr><esc>'),
                dashboard.button('r', 'Open a recent file', '<cmd>lua require("telescope.builtin").oldfiles()<cr><esc>'),
                dashboard.button('g', 'Git source control', '<cmd>LazyGit<cr>'),
                dashboard.button('p', 'Manage plugins', '<cmd>Lazy<cr>'),
                dashboard.button('q', 'Quit', '<cmd>qa<cr>')
            }

            local footer = function ()
                local datetime = os.date('%Y/%m/%d - %H:%M:%S')
                local total_plugins = require('lazy').stats().count
                local version = vim.version()
                local nvim_version_info = string.format('v%d.%d.%d', version.major, version.minor, version.patch)

                return string.format('%s    %d plugins    Neovim: %s', datetime, total_plugins, nvim_version_info)
            end
            dashboard.section.footer.val = footer()

            alpha.setup(dashboard.config)
        end
    }
}

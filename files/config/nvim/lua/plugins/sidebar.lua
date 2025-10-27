return {
    {
        'sidebar-nvim/sidebar.nvim',
        lazy = true,
        config = function()
            sidebar = require('sidebar-nvim')

            vim.keymap.set('n', '<leader>ts', sidebar.toggle, { desc = 'Toggle Sidebar' })

            sidebar.setup({
                open = false,
                side = 'right',
                initial_width = 25,
                sections = { 'git', 'containers', 'diagnostics' }
            })
        end
    }
}

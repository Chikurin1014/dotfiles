return {
     'nvim-telescope/telescope.nvim',
     keys = {
         { '<leader>ff', mode = 'n', desc = 'Find a file' },
         { '<leader>fr', mode = 'n', desc = 'Find a recent file' },
         { '<leader>f/', mode = 'n', desc = 'Find a word (live grep)' },
         { '<leader>fb', mode = 'n', desc = 'Find a buffer' },
         { '<leader>fh', mode = 'n', desc = 'Find a help' },
         { '<leader>ft', mode = 'n', desc = 'Find a function, variable, etc.' },
         { '<leader>fn', mode = 'n', desc = 'Find a notification' }
     },
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>f/', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
        vim.keymap.set('n', '<leader>fn', telescope.extensions.notify.notify, {})
     end
}

return {
     'nvim-telescope/telescope.nvim',
     keys = {
         { '<leader>ff', mode = 'n', desc = 'Find files' },
         { '<leader>fb', mode = 'n', desc = 'Find buffers' },
         { '<leader>fh', mode = 'n', desc = 'Find help tags' }
     },
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
     end
}

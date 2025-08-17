return {
    'nvim-telescope/telescope.nvim',
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
         local builtin = require('telescope.builtin')
         local set = vim.keymap.set
         local opts = {}
         set('n', '<leader>ff', builtin.find_files, {})
         set('n', '<leader>fb', builtin.buffers, {})
         set('n', '<leader>fh', builtin.help_tags, {})
     end
}

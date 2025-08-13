return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require('neo-tree').setup({
                default_component_configs = {
                    window = {
                        position = 'left',
                        width = 30,
                        mapping_options = {
                            noremap = true,
                            nowait = true,
                        },
                    },
                }
            })
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
            map('n', '<leader><C-b>', '<cmd>Neotree toggle<cr>', opts)
        end
    }
}


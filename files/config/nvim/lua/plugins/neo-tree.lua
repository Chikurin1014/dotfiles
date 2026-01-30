return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { '<leader>tn', '<cmd>Neotree toggle<cr>', mode = 'n', desc = 'Toggle Neotree' }
        },
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        opts = {
            default_component_configs = {
                window = {
                    position = 'left',
                    with = 30,
                    mapping_options = {
                        noremap = true,
                        nowait = true
                    }
                }
            }
        }
    }
}

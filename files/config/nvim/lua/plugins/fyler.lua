return {
    {
        "A7Lavinraj/fyler.nvim",
        dependencies = { "nvim-mini/mini.icons" },
        branch = "stable", -- Use stable branch for production
        lazy = false,      -- Necessary for `default_explorer` to work properly
        opts = {
            views = {
                finder = {
                    close_on_select = true,
                    default_explorer = true,
                    columns = {
                        git = {
                            enabled = true,
                        },
                    },
                    follow_current_file = true,
                },
            },
        },
        cmd = { 'Fyler' },
        keys = {
            {
                '<leader>oe',
                function()
                    local buffer_name = vim.api.nvim_buf_get_name(0)
                    local full_path = vim.fn.isabsolutepath(buffer_name) == 1
                        and buffer_name
                        or vim.fs.joinpath(vim.fn.getcwd(), buffer_name)
                    local parent_dir_fs = vim.fs.dirname(full_path)
                    local opts = {
                        dir = parent_dir_fs,
                        kind = 'float',
                    }
                    require('fyler').open(opts)
                end,
                mode = 'n',
                desc = 'Open Fyler explorer'
            },
            { '<leader>oE', '<cmd>Fyler kind=split_left_most<cr>', mode = 'n', desc = 'Open Fyler file tree' }
        }
    }
}

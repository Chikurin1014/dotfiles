return {
    {
        'folke/edgy.nvim',
        lazy = true,
        event = 'VeryLazy',
        ---@module 'edgy'
        ---@param opts Edgy.Config
        opts = {
            left = {
                {
                    title = 'Snacks explorer',
                    ft = 'snacks_layout_box',
                    size = { width = 0.2 },
                    filter = function(_, win)
                        return vim.api.nvim_win_get_config(win).relative == ''
                    end,
                }
            }
        },
        init = function()
            vim.opt.laststatus = 3
            vim.opt.splitkeep = 'screen'
        end,
    },
}

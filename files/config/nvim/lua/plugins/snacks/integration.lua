return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        specs = {
            { 'nvim-mini/mini.icons', lazy = true },
        },
        init = function()
            vim.api.nvim_create_autocmd('User', {
                pattern = 'OilActionsPost',
                callback = function(event)
                    if event.data.actions[1].type == 'move' then
                        Snacks.rename.on_rename_file(event.data.actions[1].src_url,
                            event.data.actions[1].dest_url)
                    end
                end,
            })
        end,
    },
    {
        'folke/edgy.nvim',
        optional = true,
        lazy = true,
        opts = function(_, opts)
            for _, pos in ipairs { 'top', 'bottom', 'left', 'right' } do
                opts[pos] = opts[pos] or {}
                table.insert(opts[pos], {
                    ft = 'snacks_terminal',
                    size = { height = 0.4 },
                    title = '%{b:snacks_terminal.id}: %{b:term_title}',
                    filter = function(_, win)
                        return vim.w[win].snacks_win
                            and vim.w[win].snacks_win.position == pos
                            and vim.w[win].snacks_win.relative == 'editor'
                            and not vim.w[win].trouble_preview
                    end,
                })
            end
        end,
    },
    {
        'smjonas/inc-rename.nvim',
        opational = true,
        lazy = true,
        opts = { input_buffer_type = 'snacks' },
    },
}

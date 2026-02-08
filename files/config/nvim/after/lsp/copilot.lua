return {
    on_init = function()
        -- Suggest highlight
        local hlc = vim.api.nvim_get_hl(0, { name = 'Comment' })
        local hlm = vim.api.nvim_get_hl(0, { name = 'MoreMsg' })
        vim.api.nvim_set_hl(0, 'ComplHint', vim.tbl_extend('force', hlc, { underline = true }))
        vim.api.nvim_set_hl(0, 'ComplHintMore', vim.tbl_extend('force', hlm, { underline = true }))

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local _ = args
                if vim.lsp.inline_completion then
                    -- Enable inline completion
                    vim.lsp.inline_completion.enable(true)
                    -- Toggle inline completion
                    vim.keymap.set('n', '<leader>tc', function()
                        local enable = not vim.lsp.inline_completion.is_enabled()
                        vim.lsp.inline_completion.enable(enable)
                    end, { expr = true, desc = 'Toggle copilot' })
                end

                -- Confirm with <C-y>
                vim.keymap.set('i', '<C-y>', function()
                    if not vim.lsp.inline_completion.get() then
                        return '<C-y>'
                    end
                end, { expr = true, desc = 'Confirm copilot suggestion' })

                -- <C-f>/<C-b>で補完候補を選択
                vim.keymap.set('i', '<C-f>', function()
                    vim.lsp.inline_completion.select()
                end, { desc = 'Next copilot suggestion' })
                vim.keymap.set('i', '<C-b>', function()
                    vim.lsp.inline_completion.select({ count = -1 * vim.v.count1 })
                end, { desc = 'Previous copilot suggestion' })
            end,
        })
    end,
}

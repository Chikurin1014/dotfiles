return {
    {
        'rcarriga/nvim-notify',
        lazy = true,
        config = function()
            local notify = require('notify')
            vim.notify = notify

            local on_attach = function(client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            end
            local lsp_flags = {
                debounce_text_change = 150,
            }

            notify.setup({
                on_attach = on_attach,
                lsp_flags = lsp_flags,
                background_colour = '#000000',
                render = 'compact',
                stages = 'fade_in_slide_out',
                timeout = '5000',
                top_down = false
            })
        end
    }
}

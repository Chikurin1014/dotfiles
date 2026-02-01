return {
    {
        'rcarriga/nvim-notify',
        lazy = true,
        config = function()
            local notify = require('notify')
            vim.notify = notify

            notify.setup({
                on_attach = function(client, bufnr)
                    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                end,
                lsp_flags = {
                    debounce_text_change = 150,
                },
                background_colour = '#000000',
                render = 'compact',
                stages = 'fade_in_slide_out',
                timeout = '3000',
                top_down = false
            })
        end
    }
}

return {
    {
        'L3MON4D3/LuaSnip',
        versioin = 'v2.*',
        dependencies = {
            'rafamadriz/friendly-snippets'
        },
        lazy = true,
        config = function()
            local ls = require 'luasnip'
            local types = require 'luasnip.util.types'
            ls.setup {
                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { '', 'NonText' } }
                        },
                    },
                    [types.insertNode] = {
                        active = {
                            virt_text = { { '󰗧', 'NonText' } }
                        },
                    },
                },
            }
            require('luasnip.loaders.from_lua').load {
                paths = vim.fs.joinpath(vim.fn.stdpath('config'), 'lua/snippets'),
            }

            vim.keymap.set({ "i" }, "<c-k>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<c-l>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<c-h>", function() ls.jump(-1) end, { silent = true })
            vim.keymap.set({ 'i', 's' }, '<c-n>', function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
            vim.keymap.set({ 'i', 's' }, '<c-p>', function()
                if ls.choice_active() then
                    ls.change_choice(-1)
                end
            end, { silent = true })
        end,
    },
}

return {
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        event = 'BufReadPost',
        cmd = 'Gitsigns',
        opts = {
            signs_staged_enable = true,
            signcolumn = false,
            numhl = true,
            linehl = false,
            word_diff = false,
            watch_gitdir = {
                follow_files = true,
            },
            current_line_blame = true,
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')
                local map = function(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end
                map({ 'n', 'v' }, 'g', '', { desc = 'Git' })

                map('n', ']g', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']g', bang = true })
                    end
                    gitsigns.nav_hunk('next')
                end)
                map('n', '[g', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[g', bang = true })
                    end
                    gitsigns.nav_hunk('prev')
                end)

                map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage/Unstage hunk' })
                map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
                map('v', '<leader>gs', function()
                    gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Stage/Unstage hunk' })
                map('v', '<leader>gr', function()
                    gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Reset/Unstage hunk' })
                map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })

                map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Stage/Unstage buffer' })
                map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Reset buffer' })

                map('n', '<leader>gb', function() gitsigns.blame_line({ full = true }) end, { desc = 'Blame line' })

                map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git diff' })
                map('n', '<leader>gD', function() gitsigns.diffthis('~') end,
                    { desc = 'Git diff against the last commit' })

                map('n', '<leader>tgs', gitsigns.toggle_signs, { desc = 'Toggle signs' })
                map('n', '<leader>tgn', gitsigns.toggle_numhl, { desc = 'Toggle number highlight' })
                map('n', '<leader>tgl', gitsigns.toggle_linehl, { desc = 'Toggle line highlight' })
                map('n', '<leader>tgw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff' })
                map('n', '<leader>tgb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line blame' })

                map({ 'o', 'x' }, 'ig', gitsigns.select_hunk, { desc = 'git hunk' })
            end
        },
    },
}

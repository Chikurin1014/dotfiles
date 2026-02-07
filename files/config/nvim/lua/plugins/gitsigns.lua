return {
	{
		'lewis6991/gitsigns.nvim',
		lazy = true,
		event = 'BufReadPre',
		cmd = 'Gitsigns',
		opts = {
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

				map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
				map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })
				map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
				map('v', '<leader>gs', function()
					gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
				end, { desc = 'Stage hunk' })
				map('v', '<leader>gr', function()
					gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
				end, { desc = 'Reset hunk' })
				map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
				map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })

				map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
				map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
				
				map('n', '<leader>gb', function() gitsigns.blame_line({ full = true }) end, { desc = 'Blame line' })
				
				map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git diff' })
				map('n', '<leader>gD', function() gitsigns.diffthis('~') end, { desc = 'Git diff against HEAD' })

				map('n', '<leader>gq', gitsigns.setqflist, { desc = 'Set qflist' })
				map('n', '<leader>gQ', function() gitsigns.setqflist('all') end, { desc = 'Set qflist (all)' })

				map('n', '<leader>tgb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line blame' })
				map('n', '<leader>tgw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff' })

				map({ 'o', 'x' }, 'ig', gitsigns.select_hunk, { desc = 'git hunk' })
			end
		},
	},
}

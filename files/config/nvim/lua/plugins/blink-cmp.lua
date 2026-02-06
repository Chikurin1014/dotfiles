return {
	{
		'saghen/blink.cmp',
		version = '1.*',
		dependencies = {
			-- optional: provides snippets for the snippet source
			'rafamadriz/friendly-snippets',
			'nvim-mini/mini.icons',
		},
		lazy = true,
		event = { 'InsertEnter', 'CmdLineEnter' },

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = 'default',

				['<C-u>'] = { 'scroll_documentation_up', 'scroll_signature_up', 'fallback' },
				['<C-d>'] = { 'scroll_documentation_down', 'scroll_signature_down', 'fallback' },
			},
			completion = {
				menu = {
					winblend = vim.opt.pumblend:get(),
					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
									return kind_icon
								end,
								-- (optional) use highlights from mini.icons
								highlight = function(ctx)
									local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
									return hl
								end,
							},
							kind = {
								-- (optional) use highlights from mini.icons
								highlight = function(ctx)
									local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
									return hl
								end,
							},
						},
					},
				},
				documentation = {
					auto_show = true,
					treesitter_highlighting = true,
					window = {
						winblend = vim.opt.winblend:get(),
					},
				},
				signature = {
					window = {
						winblend = vim.opt.winblend:get(),
					},
				},
			},
			cmdline = {
				keymap = { preset = 'inherit' },
				completion = { ghost_text = { enabled = true } },
			},
			sources = {
				default = function(_)
					local success, node = pcall(vim.treesitter.get_node)
					if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
						return { 'buffer' }
					elseif vim.bo.filetype == 'lua' then
						return { 'lsp', 'path' }
					else
						return { 'lsp', 'path', 'snippets', 'buffer' }
					end
				end,
				providers = {
					path = {
						opts = {
							get_cwd = function(_)
								return vim.fn.getcwd()
							end,
						},
					},
				},
			},
			fuzzy = { implementation = 'prefer_rust_with_warning' }
		},
		opts_extend = { "sources.default" },
	}
}

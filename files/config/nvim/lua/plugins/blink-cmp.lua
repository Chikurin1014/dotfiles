return {
	{
		'saghen/blink.cmp',
		version = '1.*',
		-- optional: provides snippets for the snippet source
		dependencies = { 'rafamadriz/friendly-snippets' },
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
			completion = { documentation = { auto_show = true } },
			cmdline = {
				keymap = { preset = 'inherit' },
				completion = { ghost_text = { enabled = true } },
			},
			fuzzy = { implementation = 'prefer_rust_with_warning' }
		},
		opts_extend = { "sources.default" },
	}
}

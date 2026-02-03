return {
	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = 'SafeState',
		opts = {
			window = {
				normal_hl = 'FloatFooter',
			},
			notification = {
				override_vim_notify = true,
			}
		},
	},
}

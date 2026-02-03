return {
	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = 'UIEnter',
		opts = {
			window = {
				normal_hl = 'FloatFooter',
				winblend = 5,
			},
			notification = {
				override_vim_notify = true,
			}
		},
	},
}

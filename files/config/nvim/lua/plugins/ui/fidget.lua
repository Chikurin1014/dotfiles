return {
	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = 'UIEnter',
		opts = {
			window = {
				normal_hl = 'PMenu',
				winblend = 10,
			},
			notification = {
				override_vim_notify = true,
			}
		},
	},
}

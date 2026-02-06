return {
	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = 'BufReadPre',
		opts = {
			notification = {
				override_vim_notify = true,
				window = {
					normal_hl = 'Comment',
					winblend = vim.opt.winblend:get(),
				},
			}
		},
	},
}

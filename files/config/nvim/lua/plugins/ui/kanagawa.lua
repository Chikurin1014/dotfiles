return {
	{
		'rebelot/kanagawa.nvim',
		lazy = true,
		event = 'UIEnter',
		opts = {
			undercurl = true,
			dimInactive = true,
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none"
						}
					}
				}
			},
		},
		config = function(_, opts)
			vim.opt.winblend = 5 -- transparent float window
			local kanagawa = require('kanagawa')
			kanagawa.setup(opts)
			kanagawa.load('dragon')
		end,
	}
}

return {
	{
		'nvimdev/dashboard-nvim',
		dependencies = { { 'echasnovski/mini.icons' } },
		lazy = true,
		event = 'VimEnter',
		keys = {
			{ '<leader>od', '<CMD>Dashboard<CR>', mode = 'n', desc = 'Open Dashboard' },
		},
		opts = {
			theme = 'hyper',
			config = {
				header = {
					[[   _____ _     _       _   _                 _           ]],
					[[  / ____| |   ( )     | \ | |               (_)          ]],
					[[ | |    | |__ |/ ___  |  \| | ___  _____   ___ _ __ ___  ]],
					[[ | |    | '_ \  / __| | . ` |/ _ \/ _ \ \ / / | '_ ` _ \ ]],
					[[ | |____| | | | \__ \ | |\  |  __/ (_) \ V /| | | | | | |]],
					[[  \_____|_| |_| |___/ |_| \_|\___|\___/ \_/ |_|_| |_| |_|]],
					[[                                                         ]],
					[[                                                         ]],
				},
				week_header = {
					enable = false,
				},
				shortcut = {
					{ key = 'P', desc = 'Plugins',  group = 'Label', action = 'Lazy' },
					{ key = 'F', desc = 'File',     group = 'Label', action = 'Telescope find_files' },
					{ key = 'E', desc = 'Explorer', group = 'Label', action = 'Oil' },
					{ key = 'T', desc = 'Terminal', group = 'Label', action = 'TermNew layout=float' },
					{ key = 'H', desc = 'Help',     group = 'Label', action = 'Telescope help_tags' },
					{ key = 'Q', desc = 'Quit',     group = 'Label', action = 'qa' },
				},
				packages = { enable = true },
				project = { enable = true, limit = 3, action = 'ex ' },
				mru = { enable = true, limit = 5, cwd_only = false },
				footer = {},
				vertical_center = false,
			},
		},
		config = function(_, opts)
			require('mini.icons').mock_nvim_web_devicons()
			require('dashboard').setup(opts)
		end,
	}
}

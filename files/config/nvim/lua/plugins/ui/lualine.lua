return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy = true,
		event = { 'BufReadPost', 'ModeChanged' },
		opts = {
			options = {
				theme = 'gruvbox',
				background = 'dark',
			},
			tabline = { lualine_z = { 'tabs' } },
			winbar = { lualine_a = { 'buffers' } },
			inactive_winbar = {},
			extensions = {}
		},
	},
}

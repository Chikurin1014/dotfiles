return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'echasnovski/mini.icons' },
		lazy = true,
		event = { 'VeryLazy' },
		opts = {
			options = {
				theme = 'iceberg',
				component_separators = '',
				section_separators = { left = '', right = '' },
				background = 'dark',
				disabled_filetypes = {
					statusline = { 'dashboard' },
				},
				always_show_tabline = true,
				globalstatus = true,
			},
			tabline = { lualine_a = { 'buffers' }, lualine_z = { 'tabs' } },
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		},
		config = function(_, opts)
			require('mini.icons').mock_nvim_web_devicons()
			require('lualine').setup(opts)
		end,
	},
}

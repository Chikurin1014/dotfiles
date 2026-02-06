return {
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			{ 'williamboman/mason.nvim', opts = {} },
			"neovim/nvim-lspconfig",
		},
		lazy = true,
		event = 'BufReadPre',
		keys = {
			{ '<leader>om', '<cmd>Mason<cr>', desc = 'Open Mason' },
		},
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonUpdate",
			"MasonLog",
		},
		opts = {
			-- Some LSP is not supported with the latest API
			-- See: https://github.com/neovim/nvim-lspconfig/issues/3705
			ensure_installed = {
				'bashls',
				'clangd',
				'clang-format',
				'jsonls',
				'lua_ls',
				'remark_ls',
				'pyright',
				'rust_analyzer',
				'taplo',
				'yamlls',
				'zls',
			},
		},
	},
}

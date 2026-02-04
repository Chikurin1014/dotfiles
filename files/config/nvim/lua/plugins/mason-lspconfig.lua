-- Some LSP is not supported with the latest API (see: https://github.com/neovim/nvim-lspconfig/issues/3705)
local servers = {
	'bashls',
	'clangd',
	'dockerls',
	'jsonls',
	'lua_ls',
	'remark_ls',
	'pyright',
	'rust_analyzer',
	'taplo',
	'yamlls',
	'zls',
}

return {
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			{ 'williamboman/mason.nvim', opts = {} },
			"neovim/nvim-lspconfig",
		},
		lazy = true,
		event = 'BufReadPre',
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
			"MasonUpdate",
		},
		opts = {
			ensure_installed = servers
		},
	}
}

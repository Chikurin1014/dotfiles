local user_setup = function()
	require('base')
	require('keymaps')
	require('lsp')
	if vim.g.neovide then
		require('neovide')
	end
end
require('lazy-nvim').setup({
	pre_load_callback = user_setup,
})

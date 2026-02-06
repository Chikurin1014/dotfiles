return {
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		branch = 'main',
		lazy = true,
		keys = {
			{
				'am',
				function()
					require 'nvim-treesitter-textobjects.select'.select_textobject('@function.outer', 'textobjects')
				end,
				mode = { 'x', 'o' },
				desc = 'method',
			},
			{
				'im',
				function()
					require 'nvim-treesitter-textobjects.select'.select_textobject('@function.inner', 'textobjects')
				end,
				mode = { 'x', 'o' },
				desc = 'inner method',
			},
			{
				'ac',
				function()
					require 'nvim-treesitter-textobjects.select'.select_textobject('@class.outer', 'textobjects')
				end,
				mode = { 'x', 'o' },
				desc = 'class',
			},
			{
				'ic',
				function()
					require 'nvim-treesitter-textobjects.select'.select_textobject('@class.inner', 'textobjects')
				end,
				mode = { 'x', 'o' },
				desc = 'inner class',
			},
			-- You can also use captures from other query groups like `locals.scm`
			{
				'as',
				function()
					require 'nvim-treesitter-textobjects.select'.select_textobject('@local.scope', 'locals')
				end,
				mode = { 'x', 'o' },
				desc = 'scope',
			},

			{
				'<leader><C-s>',
				mode = { 'n' },
				desc = 'Swap',
			},
			{
				'<leader><C-s>n',
				function()
					require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
				end,
				mode = { 'n' },
				desc = 'Swap parameter with next parameter',
			},
			{
				'<leader><C-s>n',
				function()
					require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.outer'
				end,
				mode = { 'n' },
				desc = 'Swap parameter with previous parameter',
			},

			{
				']m',
				function()
					require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'next function',
			},
			{
				'][',
				function()
					require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'next class',
			},
			-- You can also pass a list to group multiple queries.
			{
				']o',
				function()
					require('nvim-treesitter-textobjects.move').goto_next_start({ '@loop.inner', '@loop.outer' },
						'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'next object',
			},

			-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
			{
				']s',
				function()
					require('nvim-treesitter-textobjects.move').goto_next_start('@local.scope', 'locals')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'next scope',
			},
			{
				']z',
				function()
					require('nvim-treesitter-textobjects.move').goto_next_start('@fold', 'folds')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'next fold',
			},

			{
				']M',
				function()
					require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'next function end',
			},
			{
				']]',
				function()
					require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'next class end',
			},

			{
				'[m',
				function()
					require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'previous function',
			},
			{
				'[[',
				function()
					require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'previous class',
			},

			{
				'[M',
				function()
					require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'previous function end',
			},
			{
				'[]',
				function()
					require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
				desc = 'previous class end',
			},
		},
		opts = {
			move = {
				set_jumps = true,
			},
		},
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true

			-- Or, disable per filetype (add as you like)
			-- vim.g.no_python_maps = true
			-- vim.g.no_ruby_maps = true
			-- vim.g.no_rust_maps = true
			-- vim.g.no_go_maps = true
		end,
	}
}

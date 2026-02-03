return {
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		-- Optional dependencies
		dependencies = { { 'nvim-mini/mini.icons' } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		cmd = { 'Oil' },
		keys = {
			{ '<leader>oe', '<CMD>Oil<CR>', mode = 'n', desc = 'Open Oil explorer' },
		},
		opts = {
			default_file_explorer = true,
			keymaps = {
				["<CR>"] = { "actions.select", mode = 'n' },
				["<C-v>"] = { "actions.select", mode = 'n', opts = { vertical = true } },
				["<C-s>"] = { "actions.select", mode = 'n', opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", mode = 'n', opts = { tab = true } },
				["<C-p>"] = { "actions.preview", mode = 'n' },
				["<C-c>"] = { "actions.close", mode = "n" },
				["<leader>r"] = { "actions.refresh", mode = "n" },
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["g~"] = { "actions.cd", mode = "n", opts = { scope = "tab" } },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = { "actions.open_external", mode = "n" },
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
				["g?"] = { "actions.show_help", mode = "n" },
			},
			use_default_keymaps = false,
		},
		config = function(_, opts)
			local oil = require('oil')
			oil.setup(opts)

			local open_preview_callback = function()
				-- resize explorer window automatically
				vim.cmd('vertical resize 30')
			end

			local oil_enter_callback = function(args)
				-- open preview automattically
				local current_buf = vim.api.nvim_get_current_buf()
				if current_buf == args.data.buf and oil.get_cursor_entry() then
					oil.open_preview({}, open_preview_callback)
				end
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "OilEnter",
				callback = vim.schedule_wrap(oil_enter_callback),
			})
		end,
	},
}

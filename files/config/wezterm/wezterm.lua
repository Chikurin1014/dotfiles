local wezterm = require 'wezterm'
local config = wezterm.config_builder and wezterm.config_builder() or {}

local shell = { 'fish', '-l' }
if wezterm.target_triple:match 'windows' then
    shell = { 'nu', '-l' }
end
local home = wezterm.home_dir
local image_path = wezterm.glob(home .. '/Pictures/wezterm/bg.png')[1]

config.default_prog = shell
config.initial_rows = 24
config.initial_cols = 80

require('keymaps').apply_to_config(config)
if image_path then
    require('themes.use-image').apply_to_config(config, { image_path = image_path })
else
    require('themes.no-image').apply_to_config(config)
end

-- Integrate smart-splits.nvim keybindings
local smart_splits = require('plugins.smart-splits-nvim')
for _, key in ipairs(smart_splits.keys) do
    table.insert(config.keys, key)
end

return config

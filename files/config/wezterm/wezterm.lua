local theme = require 'themes.use-image'
local font = require 'font'
local keymaps = require 'keymaps'

-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

local system = wezterm.target_triple
local default_prog = string.match(system, 'linux') and { 'zsh', '-l' }
    or string.match(system, 'apple') and { 'zsh', '-l' }
    or string.match(system, 'windows') and { 'nu', '-l' }
    or { 'zsh', '-l' }

-- This is where you actually apply your config choices

config.default_prog = default_prog
config.initial_rows = 24
config.initial_cols = 80
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.inactive_pane_hsb = { hue = 1.0, saturation = 1.0, brightness = 0.9 }
config.hide_tab_bar_if_only_one_tab = false
config.default_cursor_style = 'BlinkingBar'

config.font = font.property
config.font_size = font.size
config.warn_about_missing_glyphs = false

config.color_scheme = theme.color_scheme
config.colors = theme.colors
config.use_fancy_tab_bar = theme.use_fancy_tab_bar
config.tab_bar_at_bottom = theme.tab_bar_at_bottom
config.window_frame = theme.window_frame
config.background = theme.background
config.show_new_tab_button_in_tab_bar = theme.show_new_tab_button_in_tab_bar
wezterm.on('format-tab-title', theme.format_tab_title)

config.disable_default_key_bindings = true
config.leader = keymaps.leader
config.keys = keymaps.keys
-- Integrate smart-splits.nvim keybindings
local smart_splits = require('plugins.smart-splits-nvim')
for _, key in ipairs(smart_splits.keys) do
    table.insert(config.keys, key)
end


-- and finally, return the configuration to wezterm
return config

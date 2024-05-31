local theme = require 'themes'.use_image
local font = require 'font'
local keybindings = require 'keybindings'

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

-- This is where you actually apply your config choices

config.default_prog = { 'zsh', '-l' }
config.initial_rows = 35
config.initial_cols = 120
config.window_decorations = 'RESIZE'
config.inactive_pane_hsb = { hue = 1.0, saturation = 0.8, brightness = 0.8 }

config.font = font.property
config.font_size = font.size
config.color_scheme = theme.color_scheme
config.use_fancy_tab_bar = theme.use_fancy_tab_bar
config.window_frame = theme.window_frame
config.background = theme.background
config.disable_default_key_bindings = true
config.leader = keybindings.leader
config.keys = keybindings.keys

-- and finally, return the configuration to wezterm
return config

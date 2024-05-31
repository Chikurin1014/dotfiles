local wezterm = require 'wezterm'

local font = {}

font.property = wezterm.font_with_fallback {
    { family = 'FirgeNerd Console', weight = 'Regular' },
    { family = 'FirgeNerd Console', weight = 'Regular', assume_emoji_presentation = true }
}
font.size = 14.0

return font

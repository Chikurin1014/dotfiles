local wezterm = require 'wezterm'

local font = {}

font.property = wezterm.font_with_fallback {
    { family = 'FirgeNerd Console', weight = 'Regular' },
    { family = 'FirgeNerd Console', weight = 'Regular', assume_emoji_presentation = true },
    { family = 'HackGen Console NF', weight = 'Regular' },
    { family = 'HackGen Console NF', weight = 'Regular', assume_emoji_presentation = true },
    'DefaVu Sans Mono'
}
font.size = 14.0

return font

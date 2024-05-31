local wezterm = require 'wezterm'

local theme = {}

theme.use_fancy_tab_bar = true
theme.color_scheme = 'Bamboo'
theme.window_frame = {
    font = wezterm.font_with_fallback {
        { family = 'FirgeNerd Console', weight = 'Bold' },
        { family = 'FirgeNerd Console', weight = 'Bold', assume_emoji_presentation = true }
    },
    font_size = 11.0,
    active_titlebar_bg = '#101713',
    inactive_titlebar_bg = '#101713',
}
theme.background = {
    {
        source = { Color = 'black' },
        hsb = {
            hue = 1.0,
            saturation = 1.0,
            brightness = 0.5,
        },
    }
}

return theme

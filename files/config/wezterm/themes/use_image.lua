local wezterm = require 'wezterm'

local os = require 'os'

local user = os.getenv("USER")
local home = os.getenv("HOME") or ("/home/" .. user)

local theme = {}

theme.use_fancy_tab_bar = true
theme.window_frame = {
    font = wezterm.font_with_fallback {
        { family = 'FirgeNerd Console', weight = 'Bold' },
        { family = 'FirgeNerd Console', weight = 'Bold', assume_emoji_presentation = true }
    },
    font_size = 11.0,
    active_titlebar_bg = '#46507C',
    inactive_titlebar_bg = '#46507C',
}
theme.background = {
    {
        source = { File = home .. '/Pictures/wezterm/bg.png' },
        hsb = {
            hue = 1.0,
            saturation = 1.0,
            brightness = 0.1,
        },
        height = 'Cover',
        width = 'Cover',
        vertical_align = 'Middle',
        horizontal_align = 'Center',
        opacity = 0.90,
        attachment = 'Fixed'
    }
}

return theme

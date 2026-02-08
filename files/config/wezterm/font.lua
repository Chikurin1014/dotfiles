return {
    apply_to_config = function(config)
        local wezterm = require 'wezterm'

        config.font = wezterm.font_with_fallback {
            { family = 'UDEV Gothic NF',     weight = 'Regular' },
            { family = 'UDEV Gothic NF',     weight = 'Regular', assume_emoji_presentation = true },
            { family = 'FirgeNerd Console',  weight = 'Regular' },
            { family = 'FirgeNerd Console',  weight = 'Regular', assume_emoji_presentation = true },
            { family = 'HackGen Console NF', weight = 'Regular' },
            { family = 'HackGen Console NF', weight = 'Regular', assume_emoji_presentation = true },
            'DefaVu Sans Mono'
        }
        config.warn_about_missing_glyphs = false
        config.font_size = 11.0
    end
}

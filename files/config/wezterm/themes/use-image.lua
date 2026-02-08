return {
    apply_to_config = function(config, args)
        local wezterm = require 'wezterm'

        local image_path = args.image_path

        require('themes.common').apply_to_config(config, {
            active_tab_bg = '#5e36ff',
            active_tab_fg = '#CCCCCC',
            inactive_tab_bg = '#555555',
            inactive_tab_fg = '#CCCCCC',
            border_color = '#494567',
        })

        config.background = {
            {
                source = { File = image_path },
                hsb = {
                    hue = 0.95,
                    saturation = 1.0,
                    brightness = 0.3,
                },
                height = 'Cover',
                width = 'Cover',
                vertical_align = 'Middle',
                horizontal_align = 'Left',
                opacity = 0.95,
                attachment = 'Fixed'
            }
        }
    end
}

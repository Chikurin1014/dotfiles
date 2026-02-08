return {
    apply_to_config = function(config)
        require('themes.common').apply_to_config(config, {
            active_tab_bg = '#005441',
            active_tab_fg = '#CCCCCC',
            inactive_tab_bg = '#555555',
            inactive_tab_fg = '#CCCCCC',
            border_color = 'none',
        })

        config.color_scheme = 'Bamboo'
        config.background = {
            {
                source = { Color = 'black' },
                hsb = {
                    hue = 0.95,
                    saturation = 1.0,
                    brightness = 0.5,
                },
            }
        }
    end
}

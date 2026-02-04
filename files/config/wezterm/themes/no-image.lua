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
    active_titlebar_bg = 'none',
    inactive_titlebar_bg = 'none',
}
theme.tab_bar_at_bottom = false
theme.show_new_tab_button_in_tab_bar = false
theme.show_close_tab_button_in_tabs = false
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
theme.colors = {
    tab_bar = {
        inactive_tab_edge = 'none'
    }
}
theme.format_tab_title = function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title
    local background = '#555555'
    local foreground = '#CCCCCC'
    if (tab.is_active) then
        background = '#036841'
    end
    local edge_background = 'none'
    local edge_foreground = background

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = wezterm.nerdfonts.ple_lower_right_triangle },

        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = ' ' .. title .. ' ' },

        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = wezterm.nerdfonts.ple_upper_left_triangle },
    }
end

return theme

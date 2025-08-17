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
    active_titlebar_bg = 'none',
    inactive_titlebar_bg = 'none',
    border_left_color = '#494567',
    border_right_color = '#494567',
    border_bottom_color = '#494567',
    border_top_color = '#494567',
    border_left_width = '1px',
    border_right_width = '1px',
    border_bottom_height = '1px',
    border_top_height = '1px',
}
theme.tab_bar_at_bottom = false
theme.show_new_tab_button_in_tab_bar = false
theme.show_close_tab_button_in_tabs = false
theme.background = {
    {
        source = { File = home .. '/Pictures/wezterm/bg.png' },
        hsb = {
            hue = 0.95,
            saturation = 1.0,
            brightness = 0.6,
        },
        height = 'Cover',
        width = 'Cover',
        vertical_align = 'Middle',
        horizontal_align = 'Left',
        opacity = 0.95,
        attachment = 'Fixed'
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
        background = '#9e6aeb'
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

return {
    apply_to_config = function(config, args)
        local wezterm = require 'wezterm'

        local active_tab_bg = args.active_tab_bg
        local active_tab_fg = args.active_tab_fg
        local inactive_tab_bg = args.inactive_tab_bg
        local inactive_tab_fg = args.inactive_tab_fg
        local border_color = args.border_color
        local font_size = args.font_size or 11.0
        local tab_font_size = args.tab_font_size or 10.0

        local font_with_fallback = function(opts)
            return wezterm.font_with_fallback {
                { family = 'UDEV Gothic NF',     weight = opts.weight },
                { family = 'UDEV Gothic NF',     weight = opts.weight, assume_emoji_presentation = true },
                { family = 'FirgeNerd Console',  weight = opts.weight },
                { family = 'FirgeNerd Console',  weight = opts.weight, assume_emoji_presentation = true },
                { family = 'HackGen Console NF', weight = opts.weight },
                { family = 'HackGen Console NF', weight = opts.weight, assume_emoji_presentation = true },
                'DefaVu Sans Mono'
            }
        end

        config.font = font_with_fallback({ weight = 'Regular' })
        config.warn_about_missing_glyphs = false
        config.font_size = font_size

        config.colors = {
            tab_bar = {
                inactive_tab_edge = 'none'
            }
        }
        config.use_fancy_tab_bar = true
        config.tab_bar_at_bottom = true
        config.show_new_tab_button_in_tab_bar = false
        -- config.show_close_tab_button_in_tabs = false
        config.window_decorations = 'RESIZE'
        config.integrated_title_button_style = 'Windows'
        config.inactive_pane_hsb = { hue = 1.0, saturation = 1.0, brightness = 0.9 }
        config.hide_tab_bar_if_only_one_tab = true
        config.default_cursor_style = 'BlinkingBar'

        config.window_frame = {
            font = font_with_fallback({ weight = 'Bold' }),
            font_size = tab_font_size,
            active_titlebar_bg = 'none',
            inactive_titlebar_bg = 'none',
            border_left_color = border_color,
            border_right_color = border_color,
            border_bottom_color = border_color,
            border_top_color = border_color,
            border_left_width = '1px',
            border_right_width = '1px',
            border_bottom_height = '1px',
            border_top_height = '1px',
        }

        wezterm.on(
            'format-tab-title',
            ---@diagnostic disable-next-line: unused-local, redefined-local
            function(tab, tabs, panes, config, hover, max_width)
                local title = tab.tab_title and #tab.tab_title > 0
                    and tab.tab_title
                    or tab.active_pane.title
                local app = title:match '([^/\\ ]+)$'
                local cwd = (title ~= app) and title:match '[.+/\\]+[^> ]+' or nil
                local dirname = cwd and cwd:match '[^/\\>- ]+$' or nil
                title = string.format(
                    '%s%s%s%s',
                    app or '',
                    app and dirname and ':' or '',
                    dirname .. '/' or '',
                    not app and not dirname and title or ''
                )
                if #title > max_width - 2 then
                    title = app and app or title:sub(1, max_width - 5) .. '...'
                end
                local bg = tab.is_active and active_tab_bg or inactive_tab_bg
                local fg = tab.is_active and active_tab_fg or inactive_tab_fg
                return {
                    { Foreground = { Color = bg } },
                    { Background = { Color = 'none' } },
                    { Text = wezterm.nerdfonts.ple_lower_right_triangle },

                    { Foreground = { Color = fg } },
                    { Background = { Color = bg } },
                    { Text = ' ' .. title .. ' ' },

                    { Foreground = { Color = bg } },
                    { Background = { Color = 'none' } },
                    { Text = wezterm.nerdfonts.ple_upper_left_triangle },
                }
            end
        )
    end,
}

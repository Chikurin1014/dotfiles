use color.nu
use detail.nu
use hooks.nu
use key.nu

export def config [] {
    {
        show_banner: false # true or false to enable or disable the welcome banner at startup

        # datetime_format determines what a datetime rendered in the shell would look like.
        # Behavior without this configuration point will be to "humanize" the datetime display,
        # showing something like "a day ago."
        datetime_format: {
            # normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
            # table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
        }

        footer_mode: always # always, never, number_of_rows, auto
        float_precision: 2 # the precision for displaying floats in tables
        buffer_editor: "" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
        use_ansi_coloring: true
        bracketed_paste: true # enable bracketed paste, currently useless on windows
        edit_mode: vi # emacs, vi
        shell_integration: {
            osc133: false
        } # enables terminal shell integration. Off by default, as some terminals have issues with this.
        render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
        use_kitty_protocol: false # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.
        highlight_resolved_externals: false # true enables highlighting of external commands in the repl resolved by which.

        color_config: (color themes).dark # if you want a more interesting theme, you can replace the empty record with `$dark_theme`, `$light_theme` or another custom record
        ls: (detail ls)
        rm: (detail rm)
        table: (detail table)
        error_style: "fancy" # "fancy" or "plain" for screen reader-friendly error messages
        explore: (detail explore)
        history: (detail history)
        completions: (detail completions)
        cursor_shape: (detail cursor_shape)
        menus: (detail menus)
        hooks: {
            pre_prompt: (hooks pre_prompt)
            pre_execution: (hooks pre_execution)
            env_change: (hooks env_change)
            display_output: (hooks display_output)
            command_not_found: (hooks command_not_found)
        }
        keybindings: (key bindings)
    }
}

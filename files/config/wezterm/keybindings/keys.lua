local wezterm = require 'wezterm'
local act = wezterm.action

local keys = {
    { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    { key = '=', mods = 'CTRL', action = act.ResetFontSize },
    { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection 'Right' },
    { key = 'o', mods = 'CTRL', action = act.ActivatePaneDirection 'Next' },
    { key = ';', mods = 'CTRL', action = act.ActivatePaneDirection 'Prev' },
    { key = 'n', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = '>', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'p', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
    { key = '<', mods = 'CTRL', action = act.ActivateTabRelative(-1) },

    { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
    { key = 'h', mods = 'SHIFT|CTRL', action = act.SplitPane{ direction =  'Left' } },
    { key = 'j', mods = 'SHIFT|CTRL', action = act.SplitPane{ direction =  'Down' } },
    { key = 'k', mods = 'SHIFT|CTRL', action = act.SplitPane{ direction =  'Up' } },
    { key = 'l', mods = 'SHIFT|CTRL', action = act.SplitPane{ direction =  'Right' } },
    { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
    { key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
    { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
    { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },

    { key = 'h', mods = 'ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
    { key = 'j', mods = 'ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },
    { key = 'k', mods = 'ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
    { key = 'l', mods = 'ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },

    { key = 'm', mods = 'ALT|SHIFT|CTRL', action = act.Hide },
    { key = 'n', mods = 'ALT|SHIFT|CTRL', action = act.MoveTabRelative(1) },
    { key = 'p', mods = 'ALT|SHIFT|CTRL', action = act.MoveTabRelative(-1) },
    { key = 'phys:Space', mods = 'ALT|SHIFT|CTRL', action = act.ToggleFullScreen },

    { key = 'PageUp', mods = 'NONE', action = act.ScrollByPage(-1) },
    { key = 'PageDown', mods = 'NONE', action = act.ScrollByPage(1) },
    { key = 'Copy', mods = 'NONE', action = act.CopyTo 'Clipboard' },
    { key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' },

    { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },
    { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },
    { key = '/', mods = 'LEADER', action = act.Search 'CurrentSelectionOrEmptyString' },
}

return keys

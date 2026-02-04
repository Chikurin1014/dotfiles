local wezterm = require 'wezterm'
local act = wezterm.action

local leader = { key = 'a', mods = 'CTRL' }

-- Comment out keybindings related to pane navigation
-- to avoid conflicts with `smart-splits.nvim` integration.
local keys = {
	{ key = 'PageUp',   mods = 'NONE',              action = act.ScrollByPage(-1) },
	{ key = 'PageDown', mods = 'NONE',              action = act.ScrollByPage(1) },
	{ key = 'Copy',     mods = 'NONE',              action = act.CopyTo 'Clipboard' },
	{ key = 'Paste',    mods = 'NONE',              action = act.PasteFrom 'Clipboard' },

	{ key = '+',        mods = 'CTRL',              action = act.IncreaseFontSize },
	{ key = '-',        mods = 'CTRL',              action = act.DecreaseFontSize },
	{ key = '=',        mods = 'CTRL',              action = act.ResetFontSize },

	{ key = 'c',        mods = 'SHIFT|CTRL',        action = act.CopyTo 'Clipboard' },
	{ key = 'v',        mods = 'SHIFT|CTRL',        action = act.PasteFrom 'Clipboard' },
	{ key = 'p',        mods = 'SHIFT|CTRL',        action = act.ActivateCommandPalette },
	{ key = 'z',        mods = 'SHIFT|CTRL',        action = act.TogglePaneZoomState },
	{ key = 'h',        mods = 'SHIFT|CTRL',        action = act.SplitPane { direction = 'Left' } },
	{ key = 'j',        mods = 'SHIFT|CTRL',        action = act.SplitPane { direction = 'Down' } },
	{ key = 'k',        mods = 'SHIFT|CTRL',        action = act.SplitPane { direction = 'Up' } },
	{ key = 'l',        mods = 'SHIFT|CTRL',        action = act.SplitPane { direction = 'Right' } },

	{ key = 'h',        mods = 'ALT|CTRL',          action = act.AdjustPaneSize { 'Left', 1 } },
	{ key = 'j',        mods = 'ALT|CTRL',          action = act.AdjustPaneSize { 'Down', 1 } },
	{ key = 'k',        mods = 'ALT|CTRL',          action = act.AdjustPaneSize { 'Up', 1 } },
	{ key = 'l',        mods = 'ALT|CTRL',          action = act.AdjustPaneSize { 'Right', 1 } },

	{ key = 'm',        mods = 'ALT|SHIFT|CTRL',    action = act.Hide },
	{ key = 'z',        mods = 'ALT|SHIFT|CTRL',    action = act.ToggleFullScreen },

	-- { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
	-- { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
	-- { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
	-- { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
	-- { key = 'o', mods = 'LEADER', action = act.ActivatePaneDirection 'Next' },
	-- { key = ';', mods = 'LEADER', action = act.ActivatePaneDirection 'Prev' },
	{ key = 'n',        mods = 'LEADER',            action = act.ActivateTabRelative(1) },
	{ key = '>',        mods = 'LEADER',            action = act.ActivateTabRelative(1) },
	{ key = 'p',        mods = 'LEADER',            action = act.ActivateTabRelative(-1) },
	{ key = '<',        mods = 'LEADER',            action = act.ActivateTabRelative(-1) },
	{ key = 't',        mods = 'LEADER',            action = act.SpawnTab 'CurrentPaneDomain' },
	{ key = 'w',        mods = 'LEADER',            action = act.CloseCurrentTab { confirm = true } },
	{ key = 'r',        mods = 'LEADER',            action = act.ReloadConfiguration },
	{ key = '[',        mods = 'LEADER',            action = act.ActivateCopyMode },
	{ key = '/',        mods = 'LEADER',            action = act.Search 'CurrentSelectionOrEmptyString' },

	{ key = 'n',        mods = 'LEADER|SHIFT',      action = act.MoveTabRelative(1) },
	{ key = 'p',        mods = 'LEADER|SHIFT',      action = act.MoveTabRelative(-1) },

	-- { key = 'l', mods = 'LEADER|ALT', action = act.ActivateTabRelative(1) },
	-- { key = 'h', mods = 'LEADER|ALT', action = act.ActivateTabRelative(-1) },

	{ key = 'n',        mods = 'LEADER|SHIFT|CTRL', action = act.SpawnWindow },
}

return {
	leader = leader,
	keys = keys,
}

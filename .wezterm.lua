local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400
-- config.color_scheme = "Dracula (Official)"
-- config.color_scheme = "Dracula (Gogh)"
config.color_scheme = "Dracula+"
config.font_size = 11
config.window_background_opacity = 0.75
config.scrollback_lines = 10000

local act = wezterm.action
config.keys = {
  {
    key = 't',
    mods = 'CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'h',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'v',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

return config

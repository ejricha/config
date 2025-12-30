local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- Fonts
config.font_size = 17

-- Colors
-- config.color_scheme = "Adventure"
-- config.color_scheme = "Apple System Colors"
-- config.color_scheme = "3024 (base16)"
-- config.color_scheme = "Atelier Forest (base16)"
-- config.color_scheme = "Atom"
-- config.color_scheme = "ayu"
-- config.color_scheme = "Brewer (dark) (base16)"
-- config.color_scheme = "Bright (base16)"
config.color_scheme = "Builtin Tango Dark"
config.colors = {
  foreground = "white",
  background = "black",
  cursor_bg = "fuchsia",
  cursor_fg = "black",
  cursor_border = "teal",
}
config.cursor_thickness = "2px"
-- config.window_background_opacity = 1.0
-- config.text_background_opacity = 1.0

-- Window
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_decorations = "NONE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.initial_cols = 120
config.initial_rows = 28
config.audible_bell = "Disabled"

-- Hotkeys
config.keys = {
  {
    mods = "", key = "F11", action = wezterm.action.ToggleFullScreen,
  }
}

return config

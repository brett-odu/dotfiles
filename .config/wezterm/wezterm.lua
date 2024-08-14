local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Fira Code",
  }),
  font_size = 12.0,
  color_scheme = "Chalk",
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
--   window_decorations = "RESIZE",
  initial_rows = 30,
  initial_cols = 100,
  window_frame = {
    active_titlebar_bg = '#282828',
    inactive_titlebar_bg = '#1d2021',
  },
  window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2,
  },
use_fancy_tab_bar = true,
window_background_opacity = 0.8,
}

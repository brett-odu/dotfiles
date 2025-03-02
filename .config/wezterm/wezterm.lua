local wezterm = require 'wezterm'

local function is_tmux_running()
  return os.getenv("TMUX") ~= nil
end

return {
  default_prog = {"/opt/homebrew/bin/tmux", "new-session", "-A", "-s", "main"}, -- Force WezTerm to start in tmux
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Fira Code",
  }),
  font_size = 12.0,
  color_scheme = "Tokyo Night",
  enable_tab_bar = not is_tmux_running(),  -- Hide tab bar when inside tmux
  hide_tab_bar_if_only_one_tab = is_tmux_running(),
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
  use_fancy_tab_bar = not is_tmux_running(),  
  window_background_opacity = 0.85,
  keys = {
    { key = "h", mods = "CTRL|SHIFT", action = wezterm.action{ActivatePaneDirection="Left"} },
    { key = "j", mods = "CTRL|SHIFT", action = wezterm.action{ActivatePaneDirection="Down"} },
    { key = "k", mods = "CTRL|SHIFT", action = wezterm.action{ActivatePaneDirection="Up"} },
    { key = "l", mods = "CTRL|SHIFT", action = wezterm.action{ActivatePaneDirection="Right"} },
  },
}

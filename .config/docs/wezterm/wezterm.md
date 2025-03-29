# WezTerm Usage Guide

## Overview
WezTerm is a GPU-accelerated terminal emulator with extensive customization options.

## Table of Contents
  - [Basic Configuration](#basic-configuration)
  - [Fonts \& Appearance](#fonts--appearance)
  - [Keybindings](#keybindings)
  - [Resources](#resources)

## Basic Configuration
The configuration file for WezTerm is located at:
```
~/.wezterm.lua
```
A sample configuration:
```lua
local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Fira Code",
  }),
  font_size = 12.0,
  color_scheme = "Tokyo Night",
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
  window_background_opacity = 0.85,
}
```

## Fonts & Appearance
- Uses `JetBrains Mono` with `Fira Code` as a fallback font
- Color scheme: **Tokyo Night**
- Configurable title bar colors and window padding

## Keybindings
- `CTRL+SHIFT+h` → Move focus left
- `CTRL+SHIFT+j` → Move focus down
- `CTRL+SHIFT+k` → Move focus up
- `CTRL+SHIFT+l` → Move focus right

## Resources
- [Default Keybindings](https://wezterm.org/config/default-keys.html)


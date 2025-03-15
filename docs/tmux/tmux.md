# Tmux Usage Guide

## Overview
Tmux is a terminal multiplexer that allows multiple sessions, windows, and panes within a single terminal.

## Table of Contents
  - [Custom Keybindings](#custom-keybindings)
  - [Window \& Pane Management](#window--pane-management)
  - [Session Management](#session-management)
  - [Additional Keybindings](#additional-keybindings)
  - [Plugins](#plugins)
  - [Resources](#resources)

## Custom Keybindings
Tmux uses `C-a` (Ctrl + a) as the prefix key, customized as follows:

- `C-a r` → Reload tmux configuration
- `C-a s` → Choose a session
- `C-a C-h` → Switch to the previous window
- `C-a C-l` → Switch to the next window
- `C-a |` → Split window **horizontally** and stay in the same directory
- `C-a -` → Split window **vertically** and stay in the same directory
- `C-a M-h` → Resize pane **left** by 20
- `C-a M-l` → Resize pane **right** by 20
- `C-a M-k` → Resize pane **up** by 7
- `C-a M-j` → Resize pane **down** by 7
- `C-a C-k` → Clear the terminal screen
- `C-a C-o` → Open a floating window with `zoxide` for quick project navigation
- `C-a C-f` → Open a floating window with `fzf` for file selection

## Window & Pane Management
- `C-a 1-9` → Jump to specific window (by index)
- `C-a w` → List all windows
- `C-a q` → Show pane numbers
- `C-a {` → Swap active pane with the pane above
- `C-a }` → Swap active pane with the pane below

## Session Management
- `tmux new -s session_name` → Create a new session
- `tmux ls` → List active sessions
- `tmux attach -t session_name` → Attach to a session
- `tmux kill-session -t session_name` → Kill a session

## Additional Keybindings
These default keybindings are also useful:
- `C-a "` → Split window **vertically**
- `C-a %` → Split window **horizontally**
- `C-a o` → Switch to next pane
- `C-a ;` → Move to the previously active pane
- `C-a x` → Kill active pane
- `C-a z` → Toggle pane zoom
- `C-a c` → Create a new window
- `C-a n` → Switch to the next window
- `C-a p` → Switch to the previous window

## Plugins
Configured plugins include:
- **Tmux Plugin Manager (TPM)**
- **tmux-resurrect** (Save and restore sessions)
- **tmux-continuum** (Auto-save sessions)
- **tmux-fzf** (Fuzzy find sessions, windows, and panes)
- **tmux-floax** (Floating windows inside Tmux)

## Resources
- [Tmux Keybindings](https://wezterm.org/config/default-keys.html)


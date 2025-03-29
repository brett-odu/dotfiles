# Tmux Plugins Guide

## Overview
Tmux supports various plugins to enhance usability and workflow. Below are the plugins configured in `~/.tmux.conf`.

## Table of Contents
  - [Tmux Plugin Manager (TPM)](#tmux-plugin-manager-tpm)
  - [Session \& Workflow Enhancements](#session--workflow-enhancements)
  - [Navigation \& Smart Selection](#navigation--smart-selection)
  - [Floating Window Management](#floating-window-management)
  - [Appearance \& Themes](#appearance--themes)
  - [Resources](#resources)

## Tmux Plugin Manager (TPM)
TPM manages tmux plugins efficiently. To install plugins:
```sh
# Press prefix (C-a) + I (capital i) to install plugins
```
To update plugins:
```sh
# Press prefix (C-a) + U
```

## Session & Workflow Enhancements
- **tmux-resurrect** → Saves and restores sessions
- **tmux-continuum** → Auto-saves tmux environment

## Navigation & Smart Selection
- **tmux-fzf-url** → Smart URL navigation
- **tmux-fzf** → Fuzzy search through sessions and windows
- **tmux-thumbs** → Smart text selection

## Floating Window Management
- **tmux-floax** → Floating windows inside tmux

## Appearance & Themes
- **tokyo-night-tmux** → Tokyo Night theme for tmux

## Resources
- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)


# Tmux.nvim Guide

## Overview
`tmux.nvim` improves integration between Neovim and Tmux by enabling seamless navigation and synchronization.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Features](#features)
  - [Resources](#resources)

## Installation
Tmux integration is included in the plugin list:
```lua
return {
    "aserowy/tmux.nvim",
}
```

## Configuration
Tmux integration is set up with:
```lua
require("tmux").setup({
    copy_sync = { enable = true },
    navigation = { enable_default_keybindings = true },
    resize = { enable_default_keybindings = true },
})
```

## Features
- **Seamless navigation** between Tmux and Neovim panes
- **Automatic clipboard synchronization**
- **Tmux pane resizing with default keybindings**

## Resources
- [Tmux.nvim GitHub](https://github.com/aserowy/tmux.nvim)
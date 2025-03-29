# Neo-tree.nvim Guide

## Overview
Neo-tree is a modern file explorer for Neovim, providing a highly customizable tree-based interface.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Keybindings](#keybindings)
  - [Features](#features)
  - [Resources](#resources)

## Installation
Neo-tree is included in the plugin list:
```lua
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
}
```

## Configuration
Neo-tree is configured with:
```lua
require("neo-tree").setup({
    close_if_last_window = false,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
})
```

## Keybindings
- `<leader>e` → Open Neo-tree file explorer
- `<space>` → Toggle node open/close
- `<cr>` → Open file
- `S` → Open in split
- `s` → Open in vertical split
- `t` → Open in new tab
- `R` → Refresh tree
- `d` → Delete file
- `r` → Rename file

## Features
- File operations: Create, delete, rename, move files
- Git status integration
- Diagnostics display
- Custom icons

## Resources
- [Neo-tree GitHub](https://github.com/nvim-neo-tree/neo-tree.nvim)


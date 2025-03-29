# ToggleTerm.nvim Guide

## Overview
`toggleterm.nvim` provides an easy way to open terminal instances inside Neovim.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Keybindings](#keybindings)
  - [Features](#features)
  - [Resources](#resources)

## Installation
ToggleTerm is included in the plugin list:
```lua
return {
    "akinsho/toggleterm.nvim",
    version = "*",
}
```

## Configuration
ToggleTerm is configured as follows:
```lua
require("toggleterm").setup({
    size = 10,
    open_mapping = "<F7>",
    shading_factor = 2,
    direction = "float",
    float_opts = {
        border = "curved",
    },
})
```

## Keybindings
- `<F7>` → Open/close floating terminal

## Features
- **Floating terminal support**
- **Customizable border styles**
- **Shading and transparency options**

## Resources
- [ToggleTerm.nvim GitHub](https://github.com/akinsho/toggleterm.nvim)
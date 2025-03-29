# Colorscheme Guide

## Overview
This configuration sets **Tokyo Night** as the default Neovim colorscheme.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Resources](#resources)

## Installation
The colorscheme is managed via `lazy.nvim`:
```lua
return {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme tokyonight-night")
    end,
}
```

## Configuration
To manually change the theme:
```lua
vim.cmd("colorscheme tokyonight-night")
```

Other available styles:
- `tokyonight-night`
- `tokyonight-storm`
- `tokyonight-day`
- `tokyonight-moon`

## Resources
- [Tokyo Night Theme](https://github.com/folke/tokyonight.nvim)


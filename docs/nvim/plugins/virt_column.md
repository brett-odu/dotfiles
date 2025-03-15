# Virt-Column.nvim Guide

## Overview
`virt-column.nvim` visually marks specified column widths in Neovim for better readability.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Features](#features)
  - [Resources](#resources)

## Installation
Virt-Column is included in the plugin list:
```lua
return {
    "lukas-reineke/virt-column.nvim",
}
```

## Configuration
Virt-Column is configured with:
```lua
require("virt-column").setup({
    char = "│", -- Thin bar character
    virtcolumn = "80,120", -- Show at these character lengths
})
```

## Features
- **Marks specified column limits**
- **Customizable marker characters**
- **Helps maintain code readability**

## Resources
- [Virt-Column.nvim GitHub](https://github.com/lukas-reineke/virt-column.nvim)


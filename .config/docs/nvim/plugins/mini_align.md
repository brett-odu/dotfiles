# Mini Align Guide

## Overview
`mini.align` provides an advanced text alignment tool for Neovim.

## Table of Contents
  - [Installation](#installation)
  - [Usage](#usage)
  - [Keybindings](#keybindings)
  - [Resources](#resources)

## Installation
Configured in `plugins/mini-align.lua`:
```lua
return {
    "echasnovski/mini.align",
    version = "*",
    config = function()
        require("mini.align").setup()
    end
}
```

## Usage
- `gaip=` → Align a paragraph by `=`
- `gaip:` → Align by `:`
- `gaip|` → Align by `|`

## Keybindings
- `ga<motion><char>` → Align by a character (e.g., `gaip=`)
- `gaa<char>` → Align a whole paragraph

## Resources
- [mini.align GitHub](https://github.com/echasnovski/mini.align)


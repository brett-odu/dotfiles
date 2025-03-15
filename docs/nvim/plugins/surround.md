# Nvim-Surround Guide

## Overview
`nvim-surround` allows easy manipulation of surrounding characters (quotes, brackets, etc.) in Neovim.

## Table of Contents
  - [Installation](#installation)
  - [Usage](#usage)
  - [Keybindings](#keybindings)
  - [Resources](#resources)

## Installation
Surround is included in the plugin list:
```lua
return {
    "kylechui/nvim-surround",
    version = "*", -- Use latest stable
    event = "VeryLazy",
}
```

## Usage
- `ysiw"` → Surround a word with quotes
- `cs"'` → Change surrounding quotes from `"` to `'`
- `ds"` → Delete surrounding quotes

## Keybindings
- **Add Surroundings**: `ys<motion><char>` (e.g., `ysiw"` → Surround word with `"`)
- **Delete Surroundings**: `ds<char>` (e.g., `ds"` → Remove surrounding `"`)
- **Change Surroundings**: `cs<old><new>` (e.g., `cs"'` → Change `"` to `'`)

## Resources
- [nvim-surround GitHub](https://github.com/kylechui/nvim-surround)


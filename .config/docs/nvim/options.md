# Neovim Options Guide

## Overview
This guide provides an overview of the core Neovim settings configured in `options.lua`.

## Table of Contents
  - [Leader Key](#leader-key)
  - [UI Settings](#ui-settings)
  - [Tab and Indentation](#tab-and-indentation)
  - [Special Characters Display](#special-characters-display)
  - [Resources](#resources)

## Leader Key
Neovim leader keys are set as:
```lua
vim.g.mapleader = " "  -- Space as leader
vim.g.maplocalleader = "\\"  -- Backslash as local leader
```

## UI Settings
- **Line numbers**: Absolute + Relative (`number` and `relativenumber` enabled)
- **True color support**: `termguicolors = true`

## Tab and Indentation
- **Tab width**: 4 spaces
- **Expand tabs**: Always use spaces instead of tabs
- **Shift width**: 4 spaces

```lua
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
```

## Special Characters Display
Neovim visually represents special characters:
```lua
vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",      -- Show tab characters
    trail = "·",     -- Show trailing spaces
    extends = "→",   -- Show line continues
    precedes = "←",  -- Show line starts
}
```

## Resources
- [Neovim Options Documentation](https://neovim.io/doc/)


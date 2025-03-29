# Comment.nvim Guide

## Overview
`Comment.nvim` is a lightweight Neovim plugin for easily toggling comments in code.

## Table of Contents
  - [Installation](#installation)
  - [Usage](#usage)
  - [Keybindings](#keybindings)
  - [Resources](#resources)

## Installation
Configured in `plugins/comment.lua`:
```lua
return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
        require("Comment").setup()
    end
}
```

## Usage
- **Toggle comment** → `gcc` (normal mode)
- **Comment selection** → `gc` (visual mode)
- **Toggle block comment** → `gbc`

## Keybindings
- `gcc` → Comment/uncomment the current line
- `gc<motion>` → Comment based on a motion (e.g., `gc}` for a block)
- `gbc` → Toggle block comment

## Resources
- [Comment.nvim GitHub](https://github.com/numToStr/Comment.nvim)


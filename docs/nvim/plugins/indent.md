# Indentation Guide (Indent-Blankline.nvim)

## Overview
This plugin provides indentation guides for better code readability in Neovim.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Features](#features)
  - [Resources](#resources)

## Installation
The plugin is included in the configuration as:
```lua
return {
    "lukas-reineke/indent-blankline.nvim",
}
```

## Configuration
Indentation guides are enabled with:
```lua
require("ibl").setup({
    indent = { char = "│" }, -- Thin vertical bar
    scope = { enabled = true }, -- Highlight active indentation level
})
```

## Features
- Displays indentation levels with vertical bars (`│`)
- Highlights the current indentation level

## Resources
- [Indent-Blankline.nvim GitHub](https://github.com/lukas-reineke/indent-blankline.nvim)
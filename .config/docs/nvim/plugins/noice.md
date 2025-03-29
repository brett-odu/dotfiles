# Noice.nvim Guide

## Overview
Noice enhances Neovim’s UI by improving notifications, search, and command-line interactions.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Features](#features)
  - [Resources](#resources)

## Installation
Noice is included in the plugin list:
```lua
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
```

## Configuration
Noice is configured with:
```lua
require("noice").setup({
    presets = {
        bottom_search = true, -- Move search UI to the bottom
        command_palette = true, -- Improve command-line UI
        long_message_to_split = true, -- Send long messages to a split window
    },
})
```

## Features
- **Enhanced search UI** (moved to the bottom)
- **Command palette** for better command-line experience
- **Long messages** appear in a split instead of cluttering the UI

## Resources
- [Noice.nvim GitHub](https://github.com/folke/noice.nvim)


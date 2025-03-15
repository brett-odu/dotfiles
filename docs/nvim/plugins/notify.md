# Notify.nvim Guide

## Overview
`nvim-notify` replaces Neovim’s default notification system with a more visually appealing UI.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Features](#features)
  - [Resources](#resources)

## Installation
Notify is included in the plugin list:
```lua
return {
    "rcarriga/nvim-notify",
}
```

## Configuration
Notify is configured as:
```lua
require("notify").setup({
    background_colour = "#000000",
    timeout = 2000, -- Notifications disappear after 2s
    stages = "fade_in_slide_out",
})

vim.notify = require("notify")
```

## Features
- **Custom notification display** with animations
- **Timeout settings** for auto-disappearing messages
- **Background customization**

## Resources
- [nvim-notify GitHub](https://github.com/rcarriga/nvim-notify)


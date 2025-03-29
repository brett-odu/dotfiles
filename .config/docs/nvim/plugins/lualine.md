# Lualine.nvim Statusline Guide

## Overview
Lualine is a lightweight and highly customizable statusline for Neovim.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Noice Integration](#noice-integration)
  - [Resources](#resources)

## Installation
Lualine is included in the plugin list:
```lua
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "folke/noice.nvim" },
}
```

## Configuration
The statusline is configured with the **Tokyo Night** theme:
```lua
require("lualine").setup({
    options = {
        theme = "tokyonight",
    },
})
```

## Noice Integration
Lualine is integrated with Noice for displaying messages and search status:
```lua
sections = {
    lualine_x = {
        {
            require("noice").api.status.message.get_hl,
            cond = require("noice").api.status.message.has,
        },
        {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
        },
    },
}
```

## Resources
- [Lualine GitHub](https://github.com/nvim-lualine/lualine.nvim)


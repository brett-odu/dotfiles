# Telescope.nvim Guide

## Overview
Telescope is a fuzzy finder plugin for Neovim, allowing fast file searching, live grep, and more.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Keybindings](#keybindings)
  - [Features](#features)
  - [Resources](#resources)

## Installation
Telescope is included in the plugin list:
```lua
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
}
```

## Configuration
Telescope is configured with:
```lua
require("telescope").setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = { prompt_position = "top", results_width = 0.6 },
        },
        winblend = 10, -- Transparency effect
    },
    pickers = {
        find_files = { theme = "dropdown" },
        live_grep = { theme = "dropdown" },
    },
})
```

## Keybindings
- `<leader>ff` → Find files
- `<leader>fg` → Live grep
- `<leader>fb` → Find buffers
- `<leader>fs` → Git status
- `<leader>fc` → Git commits
- `<leader>fp` → Find project

## Features
- **File searching** with `find_files`
- **Live grep** for searching within files
- **Git integration** for commits and status

## Resources
- [Telescope.nvim GitHub](https://github.com/nvim-telescope/telescope.nvim)
# Gitsigns.nvim Guide

## Overview
Gitsigns provides Git decorations in the Neovim sign column, including diff markers and blame annotations.

## Table of Contents
  - [Installation](#installation)
  - [Features](#features)
  - [Configuration](#configuration)
  - [Commands](#commands)
  - [Resources](#resources)

## Installation
Gitsigns is included in the plugin list:
```lua
return {
    "lewis6991/gitsigns.nvim",
}
```

## Features
- **Signs** → Show added (`┃`), changed (`┃`), and deleted (`_`) lines
- **Staged signs** → Enable `signs_staged_enable = true`
- **Blame annotations** → Toggle with `:Gitsigns toggle_current_line_blame`
- **Diff previews** → Toggle with `:Gitsigns preview_hunk`
- **Git status in sign column**

## Configuration
Gitsigns settings in `plugins/gitsigns.lua`:
```lua
require("gitsigns").setup({
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = { follow_files = true },
    auto_attach = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
    },
    sign_priority = 6,
    max_file_length = 40000,
    preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
})
```

## Commands
- `:Gitsigns toggle_signs` → Toggle Git signs
- `:Gitsigns toggle_numhl` → Toggle Git number highlights
- `:Gitsigns toggle_linehl` → Toggle Git line highlights
- `:Gitsigns preview_hunk` → Preview changes in the current hunk

## Resources
- [Gitsigns GitHub](https://github.com/lewis6991/gitsigns.nvim)


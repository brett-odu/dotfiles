# Treesitter.nvim Guide

## Overview
Treesitter provides advanced syntax highlighting and parsing for Neovim.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Supported Languages](#supported-languages)
  - [Features](#features)
  - [Resources](#resources)

## Installation
Treesitter is included in the plugin list:
```lua
return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
}
```

## Configuration
Treesitter is configured with:
```lua
require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
        "json", "javascript", "typescript", "tsx", "html",
        "css", "markdown", "lua", "vim", "go", "rust",
        "python", "bash", "dockerfile", "gitignore",
    },
    auto_install = true,
})
```

## Supported Languages
- JavaScript, TypeScript, Vue
- HTML, CSS, Markdown
- Lua, VimScript, Python, Go, Rust
- Shell, Docker, Gitignore

## Features
- **Syntax highlighting** powered by Treesitter
- **Auto-closing HTML/JSX tags** with `nvim-ts-autotag`
- **Context-aware comments** with `nvim-ts-context-commentstring`
- **Rainbow brackets** for nested structures

## Resources
- [Treesitter.nvim GitHub](https://github.com/nvim-treesitter/nvim-treesitter)


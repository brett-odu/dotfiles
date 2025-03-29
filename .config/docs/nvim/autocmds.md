# Neovim Autocommands Guide

## Overview
Autocommands automate repetitive tasks in Neovim. This guide explains the custom autocommands configured in `autocmds.lua`.

## Table of Contents
  - [Trailing Whitespace Removal](#trailing-whitespace-removal)
  - [Highlight Yanked Text](#highlight-yanked-text)
  - [Resources](#resources)

## Trailing Whitespace Removal
Before saving a file, Neovim will automatically remove trailing whitespace:
```lua
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})
```

## Highlight Yanked Text
To improve visibility, yanked text is highlighted momentarily:
```lua
autocmd("TextYankPost", {
    group = augroup("YankHighlight", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})
```

## Resources
- [Neovim Autocommands Documentation](https://neovim.io/doc/)


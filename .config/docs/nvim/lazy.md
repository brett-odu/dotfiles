# Lazy.nvim Plugin Manager Guide

## Overview
This guide explains the setup and configuration of `lazy.nvim`, Neovim’s plugin manager.

## Table of Contents
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Plugin Management](#plugin-management)
  - [Resources](#resources)

## Installation
If `lazy.nvim` is not installed, it will be automatically cloned:
```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
```

## Configuration
Before loading `lazy.nvim`, `mapleader` and `maplocalleader` are set:
```lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
```

## Plugin Management
Plugins are defined in `plugins/`, and `lazy.nvim` is set up as:
```lua
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
```

## Resources
- [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim)


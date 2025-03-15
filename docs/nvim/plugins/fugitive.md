# Fugitive.nvim Guide

## Overview
Fugitive is a powerful Git integration plugin for Neovim.

## Table of Contents
  - [Installation](#installation)
  - [Commands](#commands)
  - [Resources](#resources)

## Installation
Fugitive is included in the plugin list:
```lua
return {
    { 'tpope/vim-fugitive' }
}
```

## Commands
- `:G` → Opens the Git status window
- `:Gdiffsplit` → Shows a Git diff in a split window
- `:Gblame` → Annotates each line with Git blame
- `:Glog` → Shows commit history for the current file
- `:Gpush` → Pushes changes to remote
- `:Gpull` → Pulls changes from remote

## Resources
- [Fugitive GitHub](https://github.com/tpope/vim-fugitive)


# Completion (nvim-cmp) Guide

## Overview
`nvim-cmp` is a powerful autocompletion framework for Neovim.

## Table of Contents
  - [Setup \& Dependencies](#setup--dependencies)
  - [Keybindings](#keybindings)
  - [Completion Sources](#completion-sources)
  - [Vue-Specific Filtering](#vue-specific-filtering)
  - [UI Settings](#ui-settings)
  - [Resources](#resources)

## Setup & Dependencies
Defined in `plugins/cmp.lua`, `nvim-cmp` is loaded on `InsertEnter` and requires:
- `cmp-buffer`
- `cmp-path`
- `LuaSnip`
- `friendly-snippets`
- `lspkind.nvim`

## Keybindings
- `<Tab>` → Cycle forward through completion items
- `<S-Tab>` → Cycle backward through completion items
- `<C-e>` → Close the completion menu
- `<CR>` → Accept the selected completion
- `<C-d>` → Scroll documentation up
- `<C-f>` → Scroll documentation down

## Completion Sources
- **LSP (`nvim_lsp`)**
- **LuaSnip (`luasnip`)**
- **Buffer (`buffer`)**
- **Path (`path`)**

## Vue-Specific Filtering
- `@` → Filters event-based completions (e.g., `@click`)
- `:` → Filters prop-based completions (e.g., `:prop="value"`)

## UI Settings
- `completeopt=menuone,noinsert,noselect`
- Custom highlight linking for completion menu

## Resources
- [nvim-cmp GitHub](https://github.com/hrsh7th/nvim-cmp)
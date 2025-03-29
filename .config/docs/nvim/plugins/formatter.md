# Formatter (Conform.nvim) Guide

## Overview
This configuration uses `conform.nvim` for code formatting in Neovim.

## Table of Contents
  - [Installation](#installation)
  - [Supported Languages](#supported-languages)
  - [Format on Save](#format-on-save)
  - [Manual Formatting](#manual-formatting)
  - [Resources](#resources)

## Installation
Formatter is loaded on file read (`BufReadPre`) or new file creation (`BufNewFile`).

```lua
return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
}
```

## Supported Languages
- **JavaScript / TypeScript** → `prettier`
- **Lua** → `stylua`
- **Python** → `isort`, `black`
- **Go** → `gofmt`
- **Shell** → `shfmt`
- **Docker** → `hadolint`
- **Vue, HTML, CSS, JSON, Markdown, YAML** → `prettier`

## Format on Save
Enabled with LSP fallback:
```lua
format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
}
```

## Manual Formatting
Use `<leader>f` to manually format:
```lua
vim.keymap.set({ "n", "v" }, "<leader>f", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    })
end, { desc = "Format file or range (in visual mode)" })
```

## Resources
- [Conform.nvim GitHub](https://github.com/stevearc/conform.nvim)


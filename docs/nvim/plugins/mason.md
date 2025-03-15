# Mason.nvim Guide

## Overview
Mason is a Neovim plugin for managing LSP servers, linters, and formatters.

## Table of Contents
  - [Installation \& Dependencies](#installation--dependencies)
  - [LSP Server Management](#lsp-server-management)
  - [Tool Installation](#tool-installation)
  - [Null-LS Integration](#null-ls-integration)
  - [Resources](#resources)

## Installation & Dependencies
Mason is configured with dependencies for better LSP and tool management:
```lua
return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "jay-babu/mason-null-ls.nvim",
        "jose-elias-alvarez/null-ls.nvim",
    },
}
```

## LSP Server Management
Mason ensures automatic installation of these LSP servers:
- `bashls`, `cssls`, `dockerls`, `eslint`, `gopls`, `html`, `jsonls`, `lua_ls`, `pyright`, `rust_analyzer`, `tailwindcss`, `ts_ls`, `volar`, `yamlls`

```lua
require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = { "ts_ls", "volar", "pyright" },
})
```

## Tool Installation
Mason also installs and manages formatters and linters:
```lua
require("mason-tool-installer").setup({
    ensure_installed = {
        "prettier", "eslint_d", "black", "isort", "pylint", "stylua", "golangci-lint", "shfmt", "shellcheck", "hadolint"
    },
})
```

## Null-LS Integration
Mason integrates with `null-ls` to manage formatters and linters:
```lua
require("mason-null-ls").setup({
    ensure_installed = {
        "prettier", "eslint_d", "stylua", "black", "isort", "shfmt", "shellcheck", "hadolint"
    },
    automatic_installation = true,
})
```

## Resources
- [Mason.nvim GitHub](https://github.com/williamboman/mason.nvim)


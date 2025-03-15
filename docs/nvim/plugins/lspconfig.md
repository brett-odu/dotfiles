# LSP Configuration Guide (nvim-lspconfig)

## Overview
`nvim-lspconfig` is used to set up and configure Language Server Protocol (LSP) support in Neovim.

## Table of Contents
  - [Installation \& Dependencies](#installation--dependencies)
  - [Keybindings](#keybindings)
  - [Supported Languages](#supported-languages)
  - [Vue \& TypeScript Support](#vue--typescript-support)
  - [Resources](#resources)

## Installation & Dependencies
Configured in `plugins/lspconfig.lua`, it is loaded on `BufReadPre` and `BufNewFile` events.

Dependencies:
- `cmp-nvim-lsp` (Completion integration)
- `neodev.nvim` (Lua development enhancements)
- `mason-lspconfig.nvim` (LSP installer)

## Keybindings
- `gd` → Go to definition
- `gr` → Find references
- `K` → Hover information
- `<leader>rn` → Rename symbol
- `<leader>ca` → Code actions
- `[d` → Previous diagnostic
- `]d` → Next diagnostic
- `<leader>q` → Set location list for diagnostics

## Supported Languages
- **JavaScript/TypeScript** (`ts_ls`)
- **Vue** (`volar`)
- **Python** (`pyright`)
- **Go** (`gopls`)
- **HTML/CSS** (`html`, `cssls`)
- **JSON/YAML** (`jsonls`, `yamlls`)
- **Docker** (`dockerls`)
- **Shell** (`bashls`)
- **Rust** (`rust_analyzer`)

## Vue & TypeScript Support
For Vue development, `volar` is configured with:
```lua
nvim_lsp.volar.setup({
    filetypes = { "vue" },
    root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    capabilities = capabilities,
})
```
TypeScript uses:
```lua
nvim_lsp.ts_ls.setup({
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
    root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
})
```

## Resources
- [nvim-lspconfig GitHub](https://github.com/neovim/nvim-lspconfig)


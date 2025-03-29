# Autopairs (nvim-autopairs) Guide

## Overview
`nvim-autopairs` is a Neovim plugin that automatically closes brackets, quotes, and other pairs.

## Table of Contents
  - [Setup \& Features](#setup--features)
  - [Keybindings](#keybindings)
  - [Integration with nvim-cmp](#integration-with-nvim-cmp)
  - [Resources](#resources)

## Setup & Features
Configured in `plugins/autopairs.lua`, `nvim-autopairs` is loaded on `InsertEnter`.
```lua
require("nvim-autopairs").setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    check_ts = true,  -- Enables Treesitter integration
    map_cr = true,    -- Maps <CR> to automatically insert matching pairs
    map_bs = true,    -- Enables backspace to delete paired brackets
})
```

## Keybindings
- **Tab-out of pairs** → `<Tab>` moves past a closing bracket/quote.

## Integration with nvim-cmp
Autopairs works seamlessly with `nvim-cmp`:
```lua
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
```

## Resources
- [nvim-autopairs GitHub](https://github.com/windwp/nvim-autopairs)
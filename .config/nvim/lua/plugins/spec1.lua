return {
    -- Easy Align
    { "junegunn/vim-easy-align" },
  
    -- Treesitter (better syntax highlighting & parsing)
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = "all",
          highlight = { enable = true },
        })
      end,
    },
  
    -- CoC (Auto-completion & LSP)
    {
      "neoclide/coc.nvim",
      branch = "release",
    },
  
    -- Auto Pairs (Automatic bracket/quote pairing)
    {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({})
      end,
    },
  }
  
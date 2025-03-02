return {
    {
      'coffebar/transfer.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require("transfer").setup({})
      end
    }
  }
  
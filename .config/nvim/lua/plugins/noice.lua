return {
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify", -- Optional, for better notifications
      },
      config = function()
        require("noice").setup({
          presets = {
            bottom_search = true, -- Move search UI to the bottom
            command_palette = true, -- Make command-line look like a palette
            long_message_to_split = true, -- Send long messages to a split window
            inc_rename = false, -- Only enable if using `inc-rename.nvim`
          },
        })
      end
    }
  }
  
return {
    {
      'rcarriga/nvim-notify',
      config = function()
        vim.notify = require("notify")
        require("notify").setup({
          background_colour = "#000000",
          timeout = 2000, -- Notification disappears after 2s
          stages = "fade_in_slide_out",
        })
      end
    }
  }
  
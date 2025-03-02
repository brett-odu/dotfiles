return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "folke/noice.nvim" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight", -- Apply Tokyo Night Theme
                },
                sections = {
                    lualine_x = {
                        {
                            require("noice").api.status.message.get_hl,
                            cond = require("noice").api.status.message.has,
                        },
                        {
                            require("noice").api.status.command.get,
                            cond = require("noice").api.status.command.has,
                            color = { fg = "#ff9e64" }, -- Orange accent from Tokyo Night
                        },
                        {
                            require("noice").api.status.mode.get,
                            cond = require("noice").api.status.mode.has,
                            color = { fg = "#ff9e64" }, -- Keep colors consistent
                        },
                        {
                            require("noice").api.status.search.get,
                            cond = require("noice").api.status.search.has,
                            color = { fg = "#ff9e64" }, -- Highlight search
                        },
                    },
                },
            })
        end,
    }
}

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                prompt_prefix = " ",
                selection_caret = " ",
                color_devicons = true,
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = { prompt_position = "top", results_width = 0.6 },
                    vertical = { mirror = false },
                },
                winblend = 10, -- Transparency effect
            },
            pickers = {
                find_files = { theme = "dropdown" },
                live_grep = { theme = "dropdown" },
            },
        })

        -- Apply Tokyo Night Colors
        vim.cmd("highlight TelescopeBorder guifg=#3b4261")
        vim.cmd("highlight TelescopePromptBorder guifg=#7aa2f7")
        vim.cmd("highlight TelescopeResultsBorder guifg=#3b4261")
        vim.cmd("highlight TelescopePreviewBorder guifg=#3b4261")
        vim.cmd("highlight TelescopeSelection guibg=#3b4261 guifg=#c0caf5")
        vim.cmd("highlight TelescopeSelectionCaret guifg=#ff9e64")

        -- Keymaps
        local keymap = vim.keymap
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
        keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
    end,
}

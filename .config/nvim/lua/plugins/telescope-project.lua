return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                extensions = {
                    project = {
                        base_dirs = { "~/github", "~/test" },
                        hidden_files = true,
                        theme = "dropdown",
                    },
                },
            })

            -- Load extensions
            telescope.load_extension("project")

            -- Apply Tokyo Night Colors
            vim.cmd("highlight TelescopeProjectBorder guifg=#bb9af7")
            vim.cmd("highlight TelescopeProjectTitle guifg=#ff9e64")

            -- Keybinding for Project Switching
            vim.keymap.set("n", "<leader>fp", ":Telescope project<CR>", { noremap = true, silent = true, desc = "Find project" })
        end,
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
}

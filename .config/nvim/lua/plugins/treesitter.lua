return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",  -- Auto-close & rename HTML/JSX tags
        "JoosepAlviste/nvim-ts-context-commentstring", -- Proper comments for embedded languages
        "p00f/nvim-ts-rainbow", -- Rainbow brackets for nested expressions
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true }, -- Auto-indent code using Treesitter
            autotag = {
                enable = true,
            },
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "c",
                "rust",
                "go",
                "vue",
                "python",
                "toml",
                "graphql",
                "regex",
            },
            auto_install = true, -- Automatically install missing parsers
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            rainbow = {
                enable = true,
                disable = { "html" },
                extended_mode = true, -- Also highlight operators and keywords
                max_file_lines = 1000,
            },
        })
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })
        vim.g.skip_ts_context_commentstring_module = true
    end,
}

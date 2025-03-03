return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "jay-babu/mason-null-ls.nvim",
        "jose-elias-alvarez/null-ls.nvim",
    },

    config = function()
        require("mason").setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "bashls",
                "cssls",
                "dockerls",
                "eslint",
                "gopls",
                "helm_ls",
                "html",
                "jdtls",
                "jsonls",
                "lua_ls",
                "marksman",
                "pyright",
                "rust_analyzer",
                "ts_ls", -- ✅ Updated from `tsserver`
                "tailwindcss",
                "volar",  -- ✅ Use Volar for Vue 3
                "yamlls",
            },
        })
        require("mason-tool-installer").setup({
            ensure_installed = {
                -- JavaScript / TypeScript
                "prettier",
                "eslint_d",
        
                -- Python
                "black",
                "isort",
                "pylint",
        
                -- Lua
                "stylua",
        
                -- Go
                "golangci-lint",
        
                -- Shell
                "shfmt",
                "shellcheck",
        
                -- Docker
                "hadolint",
            },
        })
        require("mason-null-ls").setup({
            ensure_installed = {
                "prettier",
                "eslint_d",
                "stylua",
                "isort",
                "black",
                "pylint",
                "golangci-lint",
                "shfmt",
                "shellcheck",
                "hadolint",
            },
            automatic_installation = true,
        })

        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Formatting
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.shfmt,

                -- Linting
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.diagnostics.shellcheck,
                null_ls.builtins.diagnostics.hadolint,
            },
        })

        -- Apply Tokyo Night Colors
        vim.cmd("highlight MasonNormal guibg=#1a1b26 guifg=#c0caf5")
        vim.cmd("highlight MasonHeader guibg=#bb9af7 guifg=#1a1b26")
        vim.cmd("highlight MasonHighlight guifg=#ff9e64")
        vim.cmd("highlight MasonMuted guifg=#565f89")
    end,
}

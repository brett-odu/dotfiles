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
                "docker_compose_language_service",
                "dockerls",
                "eslint",
                "golangci_lint_ls",
                "gopls",
                "helm_ls",
                "html",
                "jdtls",
                "jinja_lsp",
                "jsonls",
                "lua_ls",
                "marksman",
                "pyright",
                "rubocop",
                "rust_analyzer",
                "ts_ls",
                "tailwindcss",
                "vuels",
                "yamlls",
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "isort",
                "black",
                "pylint",
                "eslint_d",
            },
        })

        require("mason-null-ls").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "isort",
                "black",
                "pylint",
                "eslint_d",
            },
            automatic_installation = true,
        })

        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.eslint_d,
            },
        })

        -- Apply Tokyo Night Colors
        vim.cmd("highlight MasonNormal guibg=#1a1b26 guifg=#c0caf5")
        vim.cmd("highlight MasonHeader guibg=#bb9af7 guifg=#1a1b26")
        vim.cmd("highlight MasonHighlight guifg=#ff9e64")
        vim.cmd("highlight MasonMuted guifg=#565f89")
    end,
}

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "jay-babu/mason-null-ls.nvim",
        "jose-elias-alvarez/null-ls.nvim",
    },
    
    config = function()
        require("mason").setup()

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
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "pylint",
                "eslint_d",
            },
        })

        require("mason-null-ls").setup({
            ensure_installed = {
                "prettier",  -- JavaScript formatter
                "stylua",    -- Lua formatter
                "isort",     -- Python formatter
                "black",     -- Python formatter
                "pylint",    -- Python linter
                "eslint_d",  -- JavaScript linter
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
                -- null_ls.builtins.diagnostics.pylint,  -- Breaks lspconfig-pyright
                null_ls.builtins.diagnostics.eslint_d,
            },
        })
    end,
}
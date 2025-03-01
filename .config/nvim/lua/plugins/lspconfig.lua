return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local nvim_lsp = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        local protocol = require("vim.lsp.protocol")

        local on_attach = function(client, bufnr)
            local bufmap = function(mode, lhs, rhs)
                vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
            end
        
            -- Format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end
        
            -- 🔥 LSP Keymaps 🔥
            bufmap("n", "gd", vim.lsp.buf.definition)
            bufmap("n", "gr", vim.lsp.buf.references)
            bufmap("n", "K", vim.lsp.buf.hover)
            bufmap("n", "<leader>rn", vim.lsp.buf.rename)
            bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
            bufmap("n", "[d", vim.diagnostic.goto_prev)
            bufmap("n", "]d", vim.diagnostic.goto_next)
            bufmap("n", "<leader>q", vim.diagnostic.setloclist)
        end
        

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        mason_lspconfig.setup_handlers({
            function(server)
                nvim_lsp[server].setup({
                    capabilities = capabilities,
                })
            end,
            ["cssls"] = function()
                nvim_lsp["cssls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["tailwindcss"] = function()
                nvim_lsp["tailwindcss"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["html"] = function()
                nvim_lsp["html"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["jsonls"] = function()
                nvim_lsp["jsonls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["eslint"] = function()
                nvim_lsp["eslint"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["pyright"] = function()
                require("lspconfig").pyright.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        python = {
                            pythonPath = vim.fn.trim(vim.fn.system("which python")),
                            analysis = {
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace",
                            },
                        },
                    },
                })
            end,
        })
    end,
}
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
        local mason_registry = require("mason-registry") -- Required for dynamically locating Vue LSP

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
        
            -- 🟢 Enable Inlay Hints (if the LSP supports it)
            if client.server_capabilities.inlayHintProvider then
                vim.lsp.buf.inlay_hint(bufnr, true)
            end
        end
        

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 🟢 Dynamically locate @vue/language-server from Mason
        local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server"

        local ts_path = vim.fn.trim(vim.fn.system("npm root -g"))

        local function get_root_dir(fname)
            return nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")(fname) or vim.loop.cwd()
        end

        mason_lspconfig.setup_handlers({
            function(server)
                nvim_lsp[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end,
            -- 🟢 Configure Volar for Vue 3
            ["volar"] = function()
                nvim_lsp.volar.setup({
                    filetypes = { "vue" }, -- ✅ Volar only handles Vue files
                    root_dir = get_root_dir,
                    init_options = {
                        vue = { hybridMode = false }, -- ✅ Ensures Volar fully handles Vue
                        typescript = { tsdk = ts_path .. "/typescript/lib" }, -- ✅ Tell Volar where TypeScript is installed
                    },
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        -- Disable formatting from Volar to prevent conflicts
                        client.server_capabilities.documentFormattingProvider = false
                        on_attach(client, bufnr)
                    end,
                })
            end,
            -- 🟢 Configure TypeScript Server (ts_ls) for Vue
            ["ts_ls"] = function()
                nvim_lsp.ts_ls.setup({
                    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
                    root_dir = get_root_dir,
                    init_options = {
                        plugins = {
                            {
                                name = "@vue/typescript-plugin",
                                location = mason_registry.get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server",
                                languages = { "vue" },
                            },
                        },
                    },
                    capabilities = capabilities,
                    on_attach = on_attach,
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
                    root_dir = nvim_lsp.util.root_pattern(".eslintrc.js", ".eslintrc.json", "package.json", ".git") or vim.loop.cwd(),
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
                                typeCheckingMode = "strict",  -- ✅ Enforce strict type checking
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace",
                            },
                        },
                    },
                })
            end,
            ["gopls"] = function()
                nvim_lsp.gopls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                                shadow = true,
                            },
                            staticcheck = true,
                        },
                    },
                })
            end,
        })
    end,
}

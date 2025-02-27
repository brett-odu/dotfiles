return {
    { "neovim/nvim-lspconfig" }, -- LSP support
    { "hrsh7th/nvim-cmp" }, -- Autocompletion
    { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
    { "saadparwaiz1/cmp_luasnip" }, -- Snippet completion
    { "L3MON4D3/LuaSnip" }, -- Snippet engine

    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.tsserver.setup({})
        lspconfig.pyright.setup({})

        local cmp = require("cmp")
        cmp.setup({
            mapping = {
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
            },
        })
    end,
}

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        -- 🟢 Improved Vue Completion Filtering
        local function is_in_start_tag()
            local ts_utils = require("nvim-treesitter.ts_utils")
            local node = ts_utils.get_node_at_cursor()
            if not node then return false end
            return vim.tbl_contains({ "start_tag", "self_closing_tag", "directive_attribute" }, node:type())
        end

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- Cycle through completion options with <Tab> and <S-Tab>
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback() -- Default tab behavior (indentation, etc.)
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- Close completion menu
                ["<C-e>"] = cmp.mapping.close(),

                -- Accept completion and insert
                ["<CR>"] = cmp.mapping.confirm({ select = true }),

                -- Scroll documentation
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
            }),
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                    entry_filter = function(entry, ctx)
                        if ctx.filetype ~= "vue" then return true end
                        local cursor_before_line = ctx.cursor_before_line

                        -- Event-based completion (e.g., @click)
                        if cursor_before_line:sub(-1) == "@" then
                            return entry.completion_item.label:match("^@")
                        -- Prop-based completion (e.g., :prop="value")
                        elseif cursor_before_line:sub(-1) == ":" then
                            return entry.completion_item.label:match("^:") and not entry.completion_item.label:match("^:on%-")
                        else
                            return true
                        end
                    end,
                },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })

        -- 🟢 Clear Treesitter Cache on Menu Close
        cmp.event:on("menu_closed", function()
            local bufnr = vim.api.nvim_get_current_buf()
            vim.b[bufnr]._vue_ts_cached_is_in_start_tag = nil
        end)

        -- 🟢 Completion UI Settings
        vim.cmd([[
          set completeopt=menuone,noinsert,noselect
          highlight! default link CmpItemKind CmpItemMenuDefault
        ]])
    end,
}

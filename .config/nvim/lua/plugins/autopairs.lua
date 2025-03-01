return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local npairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")

        npairs.setup({
            disable_filetype = { "TelescopePrompt", "vim" },
            check_ts = true, -- Enables Treesitter integration
            map_cr = true, -- Maps <CR> to automatically insert matching pairs
            map_bs = true, -- Enables backspace to delete paired brackets
        })

        -- 🔥 Integrate with nvim-cmp for function call auto-pairing
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        -- 🔹 Tab-out of parentheses, brackets, and quotes
        vim.api.nvim_set_keymap("i", "<Tab>", [[v:lua.tabout()]], { expr = true, noremap = true })

        -- Create Lua function for tabbing out of pairs
        _G.tabout = function()
            local col = vim.api.nvim_win_get_cursor(0)[2] -- Get cursor position
            local line = vim.api.nvim_get_current_line() -- Get current line content

            -- Check if the next character is a quote, bracket, or parenthesis
            if line:sub(col + 1, col + 1):match('[%)%]%}"\']') then
                return vim.api.nvim_replace_termcodes("<Right>", true, true, true)
            else
                return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
            end
        end
    end,
}

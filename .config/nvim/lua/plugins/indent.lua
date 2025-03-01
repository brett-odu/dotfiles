return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            indent = { char = "│" }, -- Use thin vertical bar
            scope = { enabled = true }, -- Highlight current indentation level
        })
    end,
}

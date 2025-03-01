return {
    "lukas-reineke/virt-column.nvim",
    config = function()
        require("virt-column").setup({
            char = "│", -- Thin bar character
            virtcolumn = "80,120", -- Show at these character lengths
        })
    end,
}

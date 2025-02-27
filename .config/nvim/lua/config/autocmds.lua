-- Define autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})

-- Highlight yanked text
autocmd("TextYankPost", {
    group = augroup("YankHighlight", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Open NvimTree automatically when opening a directory
autocmd("VimEnter", {
    group = augroup("OpenNvimTree", { clear = true }),
    callback = function()
        if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
            require("nvim-tree.api").tree.open()
        end
    end,
})


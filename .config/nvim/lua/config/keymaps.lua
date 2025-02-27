local map = vim.keymap.set

-- Clear search highlights
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Save file quickly
map("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Telescope shortcuts
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })

-- Terminal split
map("n", "<leader>t", ":split | terminal<CR>", { desc = "Open terminal in split" })

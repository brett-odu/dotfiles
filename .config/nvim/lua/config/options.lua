local global = vim.g
local o = vim.opt

global.mapleader = " "  -- Space as leader
global.maplocalleader = "\\"  -- Backslash as local leader

o.encoding = "UTF-8"
o.number = true
o.relativenumber = true
o.termguicolors = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.list = true
o.listchars = {
    tab = "» ",      -- Show tab characters
    trail = "·",     -- Show trailing spaces
    extends = "→",   -- Show line continues
    precedes = "←",  -- Show line starts
}

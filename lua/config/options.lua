-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true

opt.wrap = false

opt.cursorline = false

opt.mouse:append("a")

opt.clipboard:append("unnamedplus")

-- opt.splitright = true
-- opt.splitbelow = true

opt.smartcase = true

vim.opt.modeline = false
vim.opt.modelines = 0

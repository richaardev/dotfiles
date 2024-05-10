-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- require("lazyvim.config.options")
local is_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil

local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = ""
g.transparency = false

-- opt.swapfile = false
-- opt.backup = false
opt.undofile = true
opt.undodir = { vim.fn.stdpath("data") .. ".vim/undodir" }

opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"

-- opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- -- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.relativenumber = true

-- -- disable nvim intro
opt.shortmess:append("sI")
--
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400

-- -- interval for writing swap file to disk, also used by gitsigns
-- opt.updatetime = 250
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
-- opt.whichwrap:append("<>[]hl")

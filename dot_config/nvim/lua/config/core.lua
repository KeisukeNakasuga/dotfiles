local g = vim.g
g.mapleader = " "
g.maplocalleader = "\\"
g.editorconfig = true

local opt = vim.opt
opt.number = true
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.directory = os.getenv("HOME") .. "/.vim/swap//"
opt.undofile = true
opt.guifont = "Hack Nerd font:h10"
local undodir = vim.fn.expand("$HOME/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
opt.undodir = undodir
opt.clipboard = "unnamedplus"

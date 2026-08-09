vim.opt.nu = true

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.colorcolumn = "120"
vim.opt.listchars = "tab: ,multispace:|   ,eol:󰌑"
vim.opt.winborder = "rounded"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.lazyredraw = true
vim.opt.timeout = true
vim.opt.ttimeoutlen = 0
vim.opt.timeoutlen = 300
vim.opt.updatetime = 100
vim.opt.swapfile = false

require("git")
vim.opt.laststatus = 3
vim.opt.statusline = '%f%m%r%h%w' .. '%{%v:lua.get_git_branch()%}' .. '%= %y %p%% %l:%c'
vim.opt.cmdheight = 1
vim.opt.signcolumn = "yes"

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.lsp.inlay_hint.enable(true)

vim.g.mapleader = " "

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.guicursor = "n-v-c-i:block"

local opts = { noremap = true, silent = true }

local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader><leader>", fzf.files)
vim.keymap.set("n", "<leader>C", fzf.colorschemes)
vim.keymap.set("n", "<leader>/", fzf.live_grep)

local minifles = require("mini.files")
vim.keymap.set("n", "<leader>e", minifles.open)
-- vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", opts)

vim.keymap.set("n", "U", "<C-r>", opts)
vim.keymap.set("n", "L", ":bnext<CR>", opts)
vim.keymap.set("n", "H", ":bprev<CR>", opts)
vim.keymap.set("n", "<C-q>", ":bdelete<CR>", opts)

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

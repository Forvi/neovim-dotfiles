local opts = { noremap = true, silent = true }

local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader><leader>", fzf.files)
vim.keymap.set("n", "<leader>C", fzf.colorschemes)
vim.keymap.set("n", "<leader>/", fzf.live_grep)

vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

vim.keymap.set("n", "U", "<C-r>", opts)
vim.keymap.set("n", "L", ":bnext<CR>", opts)
vim.keymap.set("n", "H", ":bprev<CR>", opts)
vim.keymap.set("n", "<C-q>", ":bdelete<CR>", opts)

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "s", function()
    require("flash").jump()
end, { desc = "Flash jump" })

vim.keymap.set("n", "S", function()
    require("flash").treesitter()
end, { desc = "Flash treesitter" })

vim.keymap.set("n", "<leader>s", function()
    require("flash").search()
end, { desc = "Flash search" })

require('nvim-treesitter.configs').setup({
  ensure_installed = { "go", "c" },
  highlight = { enable = true },
  indent = { enable = true },
  auto_install = false,
  sync_install = false,
})

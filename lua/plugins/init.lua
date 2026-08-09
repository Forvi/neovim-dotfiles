-- install plugins
vim.pack.add({
        { src = "https://github.com/mason-org/mason.nvim" },
        { src = "https://github.com/akinsho/bufferline.nvim" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
        { src = "https://github.com/rachartier/tiny-cmdline.nvim" },
        { src = "https://github.com/nvimdev/dashboard-nvim" },
        { src = "https://github.com/ibhagwan/fzf-lua" },
        { src = 'https://github.com/nvim-mini/mini.nvim',            version = 'stable' },
        { src = "https://github.com/saghen/blink.cmp",               version = vim.version.range("^1") },
        { src = "https://github.com/stevearc/conform.nvim" },
        { src = "https://github.com/olexsmir/gopher.nvim" },

        -- themes
        { src = "https://github.com/silentium-theme/silentium.nvim" },
        { src = "https://github.com/folke/tokyonight.nvim" },
    },
    { load = true }
)

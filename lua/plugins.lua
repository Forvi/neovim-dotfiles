-- themes
vim.pack.add({
    { src = "https://github.com/silentium-theme/silentium.nvim" }
})
require("silentium").setup({})


vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" }
})
require("tokyonight").setup({})

-- mason
vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" }
})

require("mason").setup({})

-- bufferline
vim.pack.add({
    { src = "https://github.com/akinsho/bufferline.nvim" }
})

require("bufferline").setup({})

-- treesitter
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" }
})

-- cmdline
require("vim._core.ui2").enable({})
vim.pack.add({ "https://github.com/rachartier/tiny-cmdline.nvim" })
require("tiny-cmdline").setup({
    -- Cmdline window width
    width = {
        value = "60%", -- "N%" = fraction of editor columns, integer = absolute columns
        min = 40,      -- minimum width in columns
        max = 80,      -- maximum width in columns
    },

    -- Window position ("N%" = fraction of available space, integer = absolute columns/rows)
    position = {
        x = "50%", -- horizontal: "0%" = left, "50%" = center, "100%" = right
        y = "50%", -- vertical:   "0%" = top,  "50%" = center, "100%" = bottom
    },

    -- Border style for the floating window
    -- nil inherits vim.o.winborder at setup() time, falling back to "rounded"
    -- Set to "none" to disable the border
    border = nil,

    -- Horizontal offset of the completion menu anchor from the window's left inner edge
    -- Used to align blink.cmp / nvim-cmp menus with the cmdline window
    menu_col_offset = 3,

    -- Cmdline types rendered at the bottom of the screen instead of centered
    -- "/" and "?" (search) are kept native by default
    native_types = { "/", "?" },

    -- Dynamic popup title (rendered on the floating border)
    -- Disabled by default; set enabled = true to opt in
    -- Has no effect when border = "none" or when the cmdline is rendered via native_types
    title = {
        enabled = false,
        pos = "center", -- "left" | "center" | "right"
    },

    -- Optional callback invoked after every reposition
    on_reposition = nil,
    show_on_execute = false,
})

-- sessions
vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.sessions', version = 'stable' },
})

-- notify
vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.notify', version = 'stable' },
})

-- selection move
vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.move', version = 'stable' },
})
require("mini.move").setup({})

-- starter
vim.pack.add({
    { src = "https://github.com/nvimdev/dashboard-nvim" }
})

-- крутые цитаты
local headers = {
    {
        "",
        "    ╔══════════════════════════════════════════════╗",
        "    ║                                              ║",
        "║      \"The only way to do great work			 ║",
        "║       is to love what you do.\"			    ║",
        "    ║                                              ║",
        "    ║                    — Steve Jobs              ║",
        "    ╚══════════════════════════════════════════════╝",
        "",
    },
    {
        "",
        "    ╔═══════════════════════════════════════════════════════════╗",
        "    ║                                                           ║",
        "   ║  \"Simplicity is the ultimate sophistication.\"             ║",
        "    ║                                                           ║",
        "    ║                         — Leonardo da Vinci               ║",
        "    ╚═══════════════════════════════════════════════════════════╝",
        "",
    },
    {
        "",
        "    ╔═══════════════════════════════════════════════════════════╗",
        "    ║                                                           ║",
        "   ║    \"Choose a job you love, and you will never have to     ║",
        "   ║     work a day in your life.\"                             ║",
        "    ║                                                           ║",
        "    ║                         — Confucius                       ║",
        "    ╚═══════════════════════════════════════════════════════════╝",
        "",
    },
}

math.randomseed(os.time())
local h = headers[math.random(#headers)]

require("dashboard").setup({
    theme = 'doom',
    config = {
        header = h,
        center = {
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find File           ',
                desc_hl = 'String',
                key = 'b',
                key_hl = 'Number',
                key_format = ' %s',
                action = 'FzfLua files',
            },
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find Dotfiles       ',
                desc_hl = 'String',
                key = 'f',
                key_hl = 'Number',
                key_format = ' %s',
                action = 'FzfLua files cwd=~/.config/nvim',
            },
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Recent Files        ',
                desc_hl = 'String',
                key = 'r',
                key_hl = 'Number',
                key_format = ' %s',
                action = 'FzfLua oldfiles',
            },
            {
                icon = '󰊤 ',
                icon_hl = 'Title',
                desc = 'Search Text         ',
                desc_hl = 'String',
                key = 's',
                key_hl = 'Number',
                key_format = ' %s',
                action = 'FzfLua live_grep',
            },
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Config              ',
                desc_hl = 'String',
                key = 'c',
                key_hl = 'Number',
                key_format = ' %s',
                action = 'edit ~/.config/nvim/init.lua',
            },
            {
                icon = '$ ',
                icon_hl = 'Title',
                desc = 'Mason        ',
                desc_hl = 'String',
                key = 'm',
                key_hl = 'Number',
                key_format = ' %s',
                action = 'Mason',
            },
            {
                icon = '󰗼 ',
                icon_hl = 'Title',
                desc = 'Quit                ',
                desc_hl = 'String',
                key = 'q',
                key_hl = 'Number',
                key_format = ' %s',
                action = 'qa',
            },
        },
        footer = {
            "Я люблю Кристину <3",
        }
    }
})


-- fzf
vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
    winopts = {
        backdrop = 85,
        on_create = function()
            vim.opt.ttimeoutlen = 0
        end,
    },
    keymap = {
        builtin = {
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
            ["<C-p>"] = "toggle-preview",
        },
        fzf = {
            ["ctrl-a"] = "toggle-all",
            ["ctrl-t"] = "first",
            ["ctrl-g"] = "last",
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
        }
    },
    actions = {
        files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["ctrl-n"] = actions.toggle_ignore,
            ["ctrl-h"] = actions.toggle_hidden,
            ["enter"]  = actions.file_edit_or_qf,
        }
    }
})

-- mini.nvim
vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
})

vim.cmd("packadd mini.nvim")
-- vim.cmd("packadd nvim-web-devicons")

-- pick
require("mini.pick").setup({})

require("mini.pairs").setup()
require("mini.files").setup({
    options = {
        use_as_default_explorer = true,
    },
    windows = {
        width_preview = 30,
    },
})

-- mini.cursorword
require('mini.cursorword').setup({
    delay = 100,
    highlight = {
        exactly = true,
    },
})

-- icons (for mini.files)
vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.icons', version = 'stable' },
})

require("mini.icons").setup({
    -- Icon style: 'glyph' or 'ascii'
    style              = 'glyph-dark',

    -- Customize per category. See [`:h MiniIcons.config`](../doc/mini-icons.qmd#miniicons.config) for details.
    default            = {},
    directory          = {},
    extension          = {},
    file               = {},
    filetype           = {},
    lsp                = {},
    os                 = {},

    -- Control which extensions will be considered during "file" resolution
    use_file_extension = function(ext, file) return true end,
})

-- blink
vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "default",
        ["<C-space>"] = {},
        ["<C-p>"] = {},
        ["<Tab>"] = {},
        ["<S-Tab>"] = {},
        ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
        -- ["<C-e>"] = { "hide" },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },

    sources = { default = { "lsp" } }
})
-- conform
vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" }
})

-- go
vim.pack.add({
    { src = "https://github.com/olexsmir/gopher.nvim" }
})

require('gopher').setup({
    commands = {
        go = "go",
        gofmt = "gofmt",
        golangci_lint = "golangci-lint",
    },
})

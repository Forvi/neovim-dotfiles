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

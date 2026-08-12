require("neo-tree").setup({
    close_if_last_window = false,

    window = {
        position = "left",
        width = 40,
        mappings = {
            ["q"] = "close_window",
            ["l"] = "open",
            ["h"] = "close_node",
            ["H"] = "toggle_hidden",
            ["I"] = "toggle_gitignored",
        },
    },

    default_component_configs = {
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
        },
    },
    git_status = {
        enabled = false,
    },
    filesystem = {
        filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = false,
        },
        follow_current_file = {
            enabled = true,
        },
        use_libuv_file_watcher = true,
    },
})

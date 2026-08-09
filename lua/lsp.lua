local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { noremap = true, silent = true, buffer = ev.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gi", "<cmd>Glance implementations<CR>", opts)
        vim.keymap.set("n", "gr", "<cmd>Glance references<CR>", opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<space>rr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
        vim.keymap.set("n", "ff", function()
            require("conform").format({ async = true, lsp_format = "fallback" })
        end, opts)
        vim.keymap.set("n", "[k", function() vim.diagnostic.jump({ count = -1 }) end, opts)
        vim.keymap.set("n", "]k", function() vim.diagnostic.jump({ count = 1 }) end, opts)
    end,
})

-- Global LSP configuration
vim.lsp.config("*", {
    capabilities = capabilities,
})

-- yamlls
vim.lsp.config("yamlls", {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yml" },
    root_markers = { ".git" },
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = true
    end,
    settings = {
        yaml = {
            format = {
                enable = true,
            },
            schemaStore = {
                enable = true,
            },
        },
    },
})

-- buf_ls
vim.lsp.config("buf_ls", {
    cmd = { "buf-language-server" },
    filetypes = { "proto" },
    root_markers = { "buf.yaml", "buf.work.yaml", ".git" },
})

-- gopls
vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gosum", "gotmpl" },
    root_markers = { "go.mod", "go.work", ".git" },
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            gofumpt = true,
            completeUnimported = true,
            analyses = {
                unusedparams = true,
                shadow = true,
                nilness = true,
                unusedwrite = true,
                useany = true,
            },
            codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
            staticcheck = true,
            semanticTokens = true,
            ["ui.inlayhint.hints"] = {
                compositeLiteralFields = true,
                constantValues = true,
                parameterNames = true,
                functionTypeParameters = true,
                compositeLiteralTypes = true,
                assignVariableTypes = true,
            },
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            -- usePlaceholders = true,
        },
    },
})

-- conform
require("conform").setup({
    formatters_by_ft = {
        go = { "goimports", "gofmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        objc = { "clang-format" },
        objcpp = { "clang-format" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

-- lua_ls
vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostic = {
                globals = { "vim", "cmp" },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                },
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
            },
        })
    end,
    settings = {
        Lua = {},
    },
})

-- sqlls
vim.lsp.config("sqlls", {
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    filetypes = { "sql" },
    root_markers = { ".git" },
})

-- clangd
vim.lsp.config("clangd", {
    filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp" },
    cmd = { "clangd", "--background-index" },
    single_file_support = true,
    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git",
    },
    on_init = function(client)
        for _, marker in ipairs({ "sdkconfig", "idf_component.yml", "platformio.ini" }) do
            if vim.uv.fs_stat(client.root_dir .. "/" .. marker) then
                client.stop()
                return
            end
        end
    end,
})

-- clangd_esp32 (ESP-IDF / Xtensa / PlatformIO)
vim.lsp.config("clangd_esp32", {
    cmd = {
        "clangd",
        "--background-index",
        "--query-driver="
        .. vim.fn.expand("~") .. "/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-*,"
        .. vim.fn.expand("~") .. "/.espressif/tools/xtensa-esp-elf/*/bin/xtensa-esp*-elf-*",
    },
    filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp" },
    root_markers = { "sdkconfig", "idf_component.yml", "platformio.ini" },
    single_file_support = false,
})

-- dockerls
vim.lsp.config("dockerls", {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "dockerfile" },
    root_markers = { ".git" },
})

vim.cmd("cnoreabbrev rr lsp restart")
vim.cmd("cnoreabbrev LspRestart lsp restart")

vim.lsp.enable({
    "yamlls",
    "buf_ls",
    "gopls",
    "lua_ls",
    "sqlls",
    "clangd",
    "dockerls",
})

vim.diagnostic.config({ virtual_text = true })

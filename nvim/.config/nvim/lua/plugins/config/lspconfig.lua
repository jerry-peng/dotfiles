local lspconfig = require("lspconfig")
local M = {}

local lua_ls_on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
        return
    end
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
            -- Tell the language server version of Lua to use
            version = "LuaJIT",
        },
        workspace = {
            checkThirdParty = false,
            -- Make the server aware of Neovim runtime files
            library = {
                vim.env.VIMRUNTIME,
                "${3rd}/luv/library",
                -- pull in all of runtime path, though a bit slow
                -- table.unpack(vim.api.nvim_get_runtime_file("", true))
            },
        },
    })
end

M.config = function()
    vim.diagnostic.config({
        float = {
            -- specify diagnostics source if many
            source = "if_many",
        },
    })

    -- attach servers
    require("mason-lspconfig").setup({
        ensure_installed = require("plugins.config.mason-tools").servers,
        automatic_installation = false, -- servers are installed through mason-tools-installer
        -- LSP setup handlers
        handlers = {
            function(server_name) -- default handler
                lspconfig[server_name].setup({})
            end,
            ["lua_ls"] = function()
                lspconfig.lua_ls.setup({
                    on_init = function(client)
                        lua_ls_on_init(client)
                    end,
                    settings = {
                        Lua = {},
                    },
                })
            end,
            ["pyright"] = function()
                lspconfig.pyright.setup({
                    settings = {
                        pyright = {
                            -- Using Ruff's import organizer
                            disableOrganizeImports = true,
                        },
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { "*" },
                        },
                    },
                })
            end,
            ["ruff"] = function()
                lspconfig.ruff.setup({
                    on_attach = function(client)
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end,
                    trace = "messages",
                    init_options = {
                        settings = {
                            logLevel = "debug",
                        },
                    },
                })
            end,
            -- rust_analyzer is set up by rustaceannvim.
            ["rust_analyzer"] = function() end,
        },
    })
end

return M

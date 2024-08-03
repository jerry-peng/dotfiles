local lspconfig = require("lspconfig")
local M = {}

M.config = function()
    -- Initialize
    require("mason-lspconfig").setup({
        ensure_installed = require("plugins.config.mason-tools").servers,
        automatic_installation = false, -- servers are installed through mason-tools-installer
        -- LSP setup handlers
        handlers = {
            function(server_name) -- default handler
                lspconfig[server_name].setup({})
            end,
            ["lua_ls"] = function()
                local runtime_path = vim.split(package.path, ";")
                table.insert(runtime_path, "lua/?.lua")
                table.insert(runtime_path, "lua/?/init.lua")
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT",
                                path = runtime_path,
                            },
                            diagnostics = {
                                globals = { "vim" },
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                })
            end,
            ["rust_analyzer"] = function() end,
        },
    })
end

return M

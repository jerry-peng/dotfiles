local null_ls = require("null-ls")

local M = {}

M.config = function()
    null_ls.setup({
        sources = {
            -- git related code actions
            null_ls.builtins.code_actions.gitsigns.with({
                config = {
                    filter_actions = function(title)
                        return title:lower():match("blame") == nil -- filter out blame actions
                    end,
                },
            }),
            -- refactoring code actions
            null_ls.builtins.code_actions.refactoring.with({
                filetypes = {
                    "c",
                    "cpp",
                    "go",
                    "javascript",
                    "lua",
                    "python",
                    "typescript",
                    "ruby",
                },
            }),
            -- default action to cycle format/value in treesitter node
            null_ls.builtins.code_actions.ts_node_action,
        },
    })
end

return M

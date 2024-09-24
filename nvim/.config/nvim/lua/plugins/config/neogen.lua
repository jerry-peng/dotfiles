local M = {}

M.config = function()
    require("neogen").setup({
        snippet_engine = "luasnip",
    })
end

return M

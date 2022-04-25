local keys = require("core.keys")

local M = {}

M.config = function()
    require("lsp_signature").setup({
        hint_prefix = "◈ ",
        toggle_key = keys.lsp_signature.toggle
    })
end

return M

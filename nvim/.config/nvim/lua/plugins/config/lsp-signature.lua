local M = {}

M.config = function()
    require("lsp_signature").setup({
        hint_prefix = "◈ ",
        toggle_key = require("core.keymaps").passthrough.lsp_signature.toggle,
    })
end

return M

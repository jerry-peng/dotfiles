local M = {}

M.config = function()
    require("revj").setup({
        add_seperator_for_last_parameter = false,
        enable_default_keymaps = true,
    })
end

return M

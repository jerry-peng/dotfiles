local M = {}

M.config = function()
    require("aerial").setup({
        show_guides = true,
    })
end

return M

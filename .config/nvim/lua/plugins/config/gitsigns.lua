local M = {}

M.config = function()
    require("gitsigns").setup({
        numhl = true,
    })
end

return M

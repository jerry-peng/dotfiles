local M = {}

M.config = function()
    require("gitsigns").setup({
        numhl = true, -- enable number highlights
    })
end

return M

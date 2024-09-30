local M = {}

M.config = function()
    require("gitsigns").setup({
        numhl = true, -- enable number highlights
        sign_priority = 10,
    })
end

return M

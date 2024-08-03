local M = {}

M.config = function()
    require("spider").setup({
        skipInsignificantPunctuation = false,
    })
end

return M

local M = {}

M.config = function()
    require("spider").setup({
        skipInsignificantPunctuation = false, -- do not skip punctuations
    })
end

return M

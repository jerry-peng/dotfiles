local M = {}

M.config = function()
    require("inc_rename").setup({
        input_buffer_type = "dressing",
    })
end

return M

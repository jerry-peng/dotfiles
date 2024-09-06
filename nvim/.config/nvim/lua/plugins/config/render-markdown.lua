local M = {}

M.config = function()
    require("render-markdown").setup({
        -- This enables hiding any added text on the line the cursor is on
        anti_conceal = {
            enabled = true,
        },
        heading = {
            width = "block",
        },
        latex = {
            enabled = false,
        },
    })
end

return M

local M = {}

M.config = function()
    require("diffview").setup({
        default_args = {
            DiffviewOpen = { "--imply-local" },
        },
    })
end

return M

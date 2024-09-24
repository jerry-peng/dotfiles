local M = {}

M.config = function()
    require("nvim-lightbulb").setup({
        autocmd = {
            enabled = true,
        },
        sign = {
            enabled = false,
        },
        virtual_text = {
            enabled = true,
            text = "❖",
        },
    })
end

return M

local M = {}

M.config = function()
    vim.o.background = "light" -- Devicons colors are set based on background color
    require("nvim-web-devicons").setup({})
end

return M

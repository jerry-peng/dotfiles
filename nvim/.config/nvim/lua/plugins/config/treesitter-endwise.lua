local M = {}

M.config = function()
    require("nvim-treesitter.configs").setup({
        endwise = {
            enable = true,
        },
    })
end

return M

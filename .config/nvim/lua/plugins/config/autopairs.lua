local M = {}

M.config = function()
    require("nvim-autopairs").setup({
        fast_wrap = {},
        check_ts = true,
    })
end

return M

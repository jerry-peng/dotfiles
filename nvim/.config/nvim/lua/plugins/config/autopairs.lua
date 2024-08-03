local M = {}

M.config = function()
    require("nvim-autopairs").setup({
        -- don't add pair if there is close pair in the same line
        enable_check_bracket_line = false,
        -- don't add pair if next char is alphanumeric
        ignored_next_char = "[%w%.]",
        -- enable fast wrap
        fast_wrap = {},
        -- use treesitter to check for pair
        check_ts = true,
    })
end

return M

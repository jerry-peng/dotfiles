local M = {}

M.config = function()
    require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
        show_current_context_start_on_current_line = true,
        context_char = "┃",
        context_patterns = { "class", "function", "method", "^if", "^for", "^while" },
        context_pattern_highlight = {
            ["function"] = "Function",
            class = "Function",
            method = "Function",
        },
    })
end

return M

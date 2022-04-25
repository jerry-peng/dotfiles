M = {}

M.config = function()
    require("nvim-tree").setup({

        hijack_cursor = true,
        update_cwd = true,
        diagnostics = {
            enable = true,
        },
        update_focused_file = {
            enable = true,
        },
        view = {
            auto_resize = true,
        },

        indent_markers = true,
        git_hl = true,
        highlight_opened_files = true,
        group_empty = true,
        disable_window_picker = true,
        respect_buf_cwd = true
    })
end

return M

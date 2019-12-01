M = {}

M.config = function()
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_git_hl = 1
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.g.nvim_tree_group_empty = 1
    vim.g.nvim_tree_disable_window_picker = 1
    vim.g.nvim_tree_respect_buf_cwd = 1
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
    })
end

return M

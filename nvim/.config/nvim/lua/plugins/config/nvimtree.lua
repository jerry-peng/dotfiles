M = {}

M.config = function()
    require("nvim-tree").setup({
        prefer_startup_root = true,
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        diagnostics = {
            enable = true,
        },
        git = {
            enable = true,
        },
        filesystem_watchers = {
            enable = true,
        },
        renderer = {
            add_trailing = true,
            group_empty = true,
            highlight_git = true,
            highlight_modified = "icon",
            indent_markers = {
                enable = true,
            },
        },
    })
end

return M

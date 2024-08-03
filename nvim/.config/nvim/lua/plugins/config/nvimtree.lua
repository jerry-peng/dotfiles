M = {}

M.config = function()
    require("nvim-tree").setup({
        -- prefer startup root directory when updating root directory of the tree
        prefer_startup_root = true,
        -- changes tree root directory on `DirChanged` event and refresh tree
        sync_root_with_cwd = true,
        -- reload tree on `BufEnter` nvim-tree
        reload_on_bufenter = true,
        -- change cwd to new buffer's when opening nvim-tree
        respect_buf_cwd = true,
        -- update focused file on `BufEnter`, and find file in nvim-tree
        update_focused_file = {
            enable = true,
            -- update root directory of tree if the file is not under current root dir
            update_root = true,
        },
        -- enable LSP diagnostics
        diagnostics = {
            enable = true,
        },
        -- git integration
        git = {
            enable = true,
        },
        -- watch filesystem for changes
        -- this disables `BufEnter` and `BufWritePost` events used to update nvim-tree
        -- but we'll keep those configs around
        filesystem_watchers = {
            enable = true,
        },
        renderer = {
            add_trailing = true, -- append trailing slash to folder names
            group_empty = true, -- collapse folders that only contain a singole folder into the node
            highlight_git = true, -- enable highlight for git attributes
            highlight_modified = "icon", -- highlight icons and/or names for modified files
            -- configuration options for tree indent markers
            indent_markers = {
                enable = true,
            },
        },
    })
end

return M

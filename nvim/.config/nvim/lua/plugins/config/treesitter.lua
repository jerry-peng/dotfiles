local plugin_keys = require("core.key-passthru")
local M = {}

M.config = function()
    require("nvim-treesitter.configs").setup({
        -- treesitter base config
        ensure_installed = "all",
        sync_install = false,
        -- enable highlighting
        highlight = {
            enable = true,
        },
        -- set keymaps for incremental selection
        incremental_selection = {
            enable = true,
            keymaps = plugin_keys.treesitter,
        },
        -- indentation based on treesitter
        indent = {
            enable = true,
        },

        -- nvim-treesitter-textobjects
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = plugin_keys.textobj.keymaps,
            },
            swap = {
                enable = true,
                swap_next = plugin_keys.textobj.swap_next,
                swap_previous = plugin_keys.textobj.swap_previous,
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = plugin_keys.textobj.goto_next_start,
                goto_next_end = plugin_keys.textobj.goto_next_end,
                goto_previous_start = plugin_keys.textobj.goto_previous_start,
                goto_previous_end = plugin_keys.textobj.goto_previous_end,
            },
            lsp_interop = {
                enable = true,
                border = "none",
                peek_definition_code = plugin_keys.textobj.peek_definition_code,
            },
        },

        -- nvim-treesitter-endwise
        endwise = {
            enable = true,
        },
    })
end

return M

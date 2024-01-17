local keys = require("core.keymaps")
local M = {}

M.config = function()
    require("nvim-treesitter.configs").setup({
        -- treesitter base config
        ensure_installed = "all",
        sync_install = false,
        highlight = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = keys.plugins.treesitter,
        },
        indent = {
            enable = true
        },

        -- nvim-treesitter-textobjects
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = keys.plugins.textobj.keymaps,
            },
            swap = {
                enable = true,
                swap_next = keys.plugins.textobj.swap_next,
                swap_previous = keys.plugins.textobj.swap_previous,
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = keys.plugins.textobj.goto_next_start,
                goto_next_end = keys.plugins.textobj.goto_next_end,
                goto_previous_start = keys.plugins.textobj.goto_previous_start,
                goto_previous_end = keys.plugins.textobj.goto_previous_end,
            },
            lsp_interop = {
                enable = true,
                border = "none",
                peek_definition_code = keys.plugins.textobj.peek_definition_code,
            },
        },
        -- nvim-ts-autotag
        autotag = {
            enable = true,
        },
        -- nvim-treesitter-endwise
        endwise = {
            enable = true,
        },
    })
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

return M

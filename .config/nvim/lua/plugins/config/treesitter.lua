local keys = require("core.keys")
local M = {}

M.config = function()
    require("nvim-treesitter.configs").setup({
        sync_install = false,
        highlight = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = keys.treesitter,
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },

        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = keys.playground,
        },

        rainbow = {
            enable = true,
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = keys.textobj.keymaps,
            },
            swap = {
                enable = true,
                swap_next = keys.textobj.swap_next,
                swap_previous = keys.textobj.swap_previous,
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = keys.textobj.goto_next_start,
                goto_next_end = keys.textobj.goto_next_end,
                goto_previous_start = keys.textobj.goto_previous_start,
                goto_previous_end = keys.textobj.goto_previous_end,
            },
            lsp_interop = {
                enable = true,
                border = "none",
                peek_definition_code = keys.textobj.peek_definition_code,
            },
        },

        autotag = {
            enable = true,
        },
    })
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

return M

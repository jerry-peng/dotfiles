-- Plugin key configurations that is registered through plugin setup
local mappings = {
    help = {
        enter = "<CR>",
        back = "<BS>",
    },
    telescope = {
        toggle_preview = "<C-o>",
        close = "<C-c>",
        open_trouble = "<C-t>", -- override default open in new tab
        cycle_previews_next = "<C-y>",
    },
    treesitter = {
        init_selection = ",s",
        node_decremental = ",d",
        node_incremental = ",i",
        scope_incremental = ",o",
    },
    textobj = {
        keymaps = {
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
        },
        swap_next = {
            ["<leader>an"] = "@parameter.inner",
        },
        swap_previous = {
            ["<leader>ap"] = "@parameter.inner",
        },
        goto_next_start = {
            ["][c"] = "@class.outer",
            ["][f"] = "@function.outer",
            ["][b"] = "@block.outer",
            ["][a"] = "@parameter.outer",
        },
        goto_next_end = {
            ["]]c"] = "@class.outer",
            ["]]f"] = "@function.outer",
            ["]]b"] = "@block.outer",
            ["]]a"] = "@parameter.outer",
        },
        goto_previous_start = {
            ["[[c"] = "@class.outer",
            ["[[f"] = "@function.outer",
            ["[[b"] = "@block.outer",
            ["[[p"] = "@parameter.outer",
        },
        goto_previous_end = {
            ["[]c"] = "@class.outer",
            ["[]f"] = "@function.outer",
            ["[]b"] = "@block.outer",
            ["[]p"] = "@parameter.outer",
        },
        peek_definition_code = {
            ["<leader>pf"] = "@function.outer",
            ["<leader>pc"] = "@class.outer",
        },
    },
    cmp = {
        scroll_docs_up = "<C-u>",
        scroll_docs_down = "<C-d>",
        toggle = "<C-c>",
        abort = "<C-a>",
        prev_item = "<C-p>",
        next_item = "<C-n>",
        tab = "<Tab>",
        shift_tab = "<S-Tab>",
    },
}

return mappings

local mappings = {}
mappings["default"] = {}
mappings["plugins"] = {}

-- default mode
mappings["default"][""] = {
    fs = { '<cmd>lua require"hop".hint_char1()<CR>' },
    ff = { '<cmd>lua require"hop".hint_char2()<CR>' },
    fl = { '<cmd>lua require"hop".hint_lines_skip_whitespace()<CR>' },
    fw = { '<cmd>lua require"hop".hint_words()<CR>' },
    fp = { '<cmd>lua require"hop".hint_patterns()<CR>' },
    [",w"] = { "<Plug>CamelCaseMotion_w", { noremap = false } },
    [",b"] = { "<Plug>CamelCaseMotion_b", { noremap = false } },
    [",e"] = { "<Plug>CamelCaseMotion_e", { noremap = false } },
    [",ge"] = { "<Plug>CamelCaseMotion_ge", { noremap = false } },
}

-- n-mode
mappings["default"]["n"] = {
    -- more natural movement with wrap on
    j = { 'v:count == 0 ? "gj" : "j"', { expr = true } },
    k = { 'v:count == 0 ? "gk" : "k"', { expr = true } },

    -- H/L move to start/end of line
    H = { "^" },
    L = { "$" },

    -- override ? to use sane regexes (not used since we have auto-completion)
    ["?"] = { "/\\v" },

    -- don't jump when using *, enables hlslens
    ["*"] = { '*<C-o><bar><cmd>lua require("hlslens").start()<CR>' },

    ["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>" },
    ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>" },

    ["<C-a>"] = { "<Plug>(dial-increment)", { noremap = false } },
    ["<C-x>"] = { "<Plug>(dial-decrement)", { noremap = false } },
    ["<C-p>"] = { "<cmd>MarkdownPreview<CR>" }, -- TODO override
    ["<C-n>"] = { "<cmd>NvimTreeToggle<CR>" }, -- TODO override

    ["<M-q>"] = { "<cmd>Bdelete<CR>" },
    ["<M-Q>"] = { "<cmd>Bdelete!<CR>" },

    ["<Up>"] = { "<C-w>-" },
    ["<Down>"] = { "<C-w>+" },
    ["<Left>"] = { "<C-w><" },
    ["<Right>"] = { "<C-w>>" },

    ["[c"] = { "&diff ? ']c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true } },
    ["]c"] = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true } },

    ["<leader>1"] = { "<cmd>BufferLineGoToBuffer 1<CR>" },
    ["<leader>2"] = { "<cmd>BufferLineGoToBuffer 2<CR>" },
    ["<leader>3"] = { "<cmd>BufferLineGoToBuffer 3<CR>" },
    ["<leader>4"] = { "<cmd>BufferLineGoToBuffer 4<CR>" },
    ["<leader>5"] = { "<cmd>BufferLineGoToBuffer 5<CR>" },
    ["<leader>6"] = { "<cmd>BufferLineGoToBuffer 6<CR>" },
    ["<leader>7"] = { "<cmd>BufferLineGoToBuffer 7<CR>" },
    ["<leader>8"] = { "<cmd>BufferLineGoToBuffer 8<CR>" },
    ["<leader>9"] = { "<cmd>BufferLineGoToBuffer 9<CR>" },

    ["<leader>y"] = { '"*y' },
    ["<leader>yy"] = { '"*yy' },
    ["<leader>p"] = { '"*p' },

    ["<leader>bh"] = { "<cmd>BufferLineCloseLeft<CR>" },
    ["<leader>bl"] = { "<cmd>BufferLineCloseRight<CR>" },
    ["<leader>bb"] = { "<cmd>BufferLinePick<CR>" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<CR>" },
    ["<leader>be"] = { "<cmd>BufferLineSortByExtension<CR>" },
    ["<leader>bd"] = { "<cmd>BufferLineSortByDirectory<CR>" },

    ["<leader>c"] = { ":noh<CR>" },

    ["<leader>db"] = { '<cmd>lua require"dap".toggle_breakpoint()<CR>' },
    ["<leader>dc"] = { '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>' },
    ["<leader>dp"] = {
        '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
    },
    ["<F5>"] = { '<cmd>lua require"dap".continue()<CR>' },
    ["<F10>"] = { '<cmd>lua require"dap".step_out()<CR>' },
    ["<F11>"] = { '<cmd>lua require"dap".step_into()<CR>' },
    ["<F12>"] = { '<cmd>lua require"dap".step_over()<CR>' },
    ["<leader>dr"] = { '<cmd>lua require"dap".repl.open()<CR>' },
    ["<leader>dl"] = { '<cmd>lua require"dap".run_last()<CR>' },

    ["<leader>dss"] = { '<cmd>lua require("plugins.config.dap").scopes()<CR>' },
    ["<leader>dsf"] = { '<cmd>lua require("plugins.config.dap").frames()<CR>' },
    ["<leader>dsh"] = { '<cmd>lua require("plugins.config.dap").expressions()<CR>' },

    ["<leader>dtm"] = { '<cmd>lua require("dap-python").test_method()<CR>' },
    ["<leader>dtl"] = { '<cmd>lua require("dap-python").test_class()<CR>' },
    ["<leader>dfm"] = { "<cmd>Telescope dap commands<CR>" },
    ["<leader>dfo"] = { "<cmd>Telescope dap configurations<CR>" },
    ["<leader>dfl"] = { "<cmd>Telescope dap list_breakpoints<CR>" },
    ["<leader>dfv"] = { "<cmd>Telescope dap variables<CR>" },
    ["<leader>dff"] = { "<cmd>Telescope dap frames<CR>" },

    ["<leader>ff"] = { '<cmd>lua require("telescope.builtin").find_files()<CR>' },
    ["<leader>fd"] = { '<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>' },
    ["<leader>f/"] = { '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>' },
    ["<leader>ft"] = { '<cmd>lua require("telescope.builtin").help_tags()<CR>' },
    ["<leader>fl"] = { '<cmd>lua require("telescope.builtin").live_grep()<CR>' },
    ["<leader>fb"] = { '<cmd>lua require("telescope.builtin").buffers()<CR>' },
    ["<leader>fa"] = { '<cmd>lua require("telescope.builtin").builtin()<CR>' },
    ["<leader>fc"] = { '<cmd>lua require("telescope.builtin").commands()<CR>' },
    ["<leader>fhc"] = { '<cmd>lua require("telescope.builtin").command_history()<CR>' },
    ["<leader>fhs"] = { '<cmd>lua require("telescope.builtin").search_history()<CR>' },

    gD = { "<cmd>lua vim.lsp.buf.declaration()<CR>" },
    gd = { "<cmd>lua vim.lsp.buf.definition()<CR>" },
    gr = { "<cmd>lua vim.lsp.buf.references()<CR>" }, -- TODO duplicate key
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>" },
    gi = { "<cmd>lua vim.lsp.buf.implementation()<CR>" }, -- TODO in conflict with default gi
    ["<leader>wa"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" },
    ["<leader>wr"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
    ["<leader>wf"] = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" },
    ["<leader>lt"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
    ["<leader>ls"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
    ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<CR>" },
    ["<leader>lc"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>" },
    ["<leader>lf"] = { "<cmd>lua vim.lsp.buf.format{async=true}<CR>" },
    ["<leader>dd"] = { "<cmd>lua vim.diagnostic.open_float()<CR>" },
    ["<leader>dq"] = { "<cmd>lua vim.diagnostic.setqflist()<CR>" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>" },

    ["<leader>q"] = { '<cmd>lua require"core.utils".close_float_windows()<CR>' },

    ["<leader>rr"] = { '<Esc><cmd>lua require("telescope").extensions.refactoring.refactors()<CR>' },

    ["<leader>ss"] = { "<cmd>SnipRun<CR>" },
    ["<leader>sr"] = { "<cmd>SnipReset<CR>" },
    ["<leader>sc"] = { "<cmd>SnipClose<CR>" },
    ["<leader>si"] = { "<cmd>SnipInfo<CR>" },
    ["<leader>sm"] = { "<cmd>SnipReplMemoryClean<CR>" },

    ["<leader>uu"] = { "<cmd>Ultest<CR>" },
    ["<leader>un"] = { "<cmd>UltestNearest<CR>" },
    ["<leader>ul"] = { "<cmd>UltestLast<CR>" },
    ["<leader>ud"] = { "<cmd>UltestDebug<CR>" },
    ["<leader>udn"] = { "<cmd>UltestDebugNearest<CR>" },
    ["<leader>uo"] = { "<cmd>UltestOutput<CR>" },
    ["<leader>ua"] = { "<cmd>UltestAttach<CR>" },
    ["<leader>ut"] = { "<cmd>UltestStop<CR>" },
    ["<leader>us"] = { "<cmd>UltestSummary<CR>" },
    ["<leader>uc"] = { "<cmd>UltestClear<CR>" },
    ["[t"] = { "<Plug>(ultest-prev-fail)", { noremap = false } },
    ["]t"] = { "<Plug>(ultest-next-fail)", { noremap = false } },

    ["<leader>w-"] = { "<c-w>=" },
    ["<leader>w="] = { "<C-w><Bar><C-w>_<CR>" },
    ["<leader>wh"] = { "<C-w>5<" },
    ["<leader>wj"] = { "<cmd>resize +5<cr>" },
    ["<leader>wk"] = { "<cmd>resize -5<cr>" },
    ["<leader>wl"] = { "<C-w>5>" },

    gr = { "<cmd>TroubleToggle lsp_references<cr>" },
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>" },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>" },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>" },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>" },
    ["[x"] = { ':lua require("trouble").next({skip_groups = true, jump = true});<CR>' },
    ["]x"] = { ':lua require("trouble").previous({skip_groups = true, jump = true});<CR>' },

    ["<leader>?"] = { '<cmd>execute "vimgrep /".@/."/g %"<CR>:copen<CR>' },
}

-- o-mode
mappings["default"]["o"] = {
    al = { "<cmd>norm val<CR>" },
    il = { "<cmd>norm vil<CR>" },
    -- ["iw"] = { "<Plug>CamelCaseMotion_iw", { noremap = false } },
    -- ["ib"] = { "<Plug>CamelCaseMotion_ib", { noremap = false } },
    -- ["ie"] = { "<Plug>CamelCaseMotion_ie", { noremap = false } },
}

-- x-mode
mappings["default"]["x"] = {
    -- more natural movement with wrap on
    j = { 'v:count == 0 ? "gj" : "j"', { expr = true } },
    k = { 'v:count == 0 ? "gk" : "k"', { expr = true } },

    -- sane regexes
    ["/"] = { "/\\v" },

    -- reselect visual block after indent/outdent
    ["<"] = { "<gv" },
    [">"] = { ">gv" },

    -- line text objects
    al = { "$o^" },
    il = { "g_o^" },

    -- iw = { "<Plug>CamelCaseMotion_iw", { noremap = false } },
    -- ib = { "<Plug>CamelCaseMotion_ib", { noremap = false } },
    -- ie = { "<Plug>CamelCaseMotion_ie", { noremap = false } },

    ["<C-a>"] = { "<Plug>(dial-increment)", { noremap = false } },
    ["<C-x>"] = { "<Plug>(dial-decrement)", { noremap = false } },
    ["g<C-a>"] = { "<Plug>(dial-increment-additional)", { noremap = false } },
    ["g<C-x>"] = { "<Plug>(dial-decrement-additional)", { noremap = false } },

    ["<leader>ds"] = { '<ESC>:lua require("dap-python").debug_selection()<CR>' },

    ["<leader>y"] = { '"*y' },
    ["<leader>p"] = { '"*p' },

    ["<leader>re"] = { '<Esc><Cmd>lua require("refactoring").refactor("Extract Function")<CR>' },
    ["<leader>rf"] = { '<Esc><Cmd>lua require("refactoring").refactor("Extract Function To File")<CR>' },
    ["<leader>rv"] = { '<Esc><Cmd>lua require("refactoring").refactor("Extract Variable")<CR>' },
    ["<leader>ri"] = { '<Esc><Cmd>lua require("refactoring").refactor("Inline Variable")<CR>' },

    ["<leader>ss"] = { ":'<,'>SnipRun<CR>" },
    ["<leader>lc"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>" },
}

-- i-mode
mappings["default"]["i"] = {
    ["<M-b>"] = { "<C-o><Plug>CamelCaseMotion_b", { noremap = false } },
    ["<M-w>"] = { "<C-o><Plug>CamelCaseMotion_w", { noremap = false } },
    ["<M-p>"] = { "<C-r>*" },
}

-- c-mode
mappings["default"]["c"] = {
    ["<C-a>"] = { "<home>" },
    ["<C-e>"] = { "<end>" },
}


-- Plugin key configurations that is registered through plugin setup
mappings["plugins"] = {
    after = {
        -- Override vim-move
        -- TODO: move this to default key maps. Keymaps are already defined after plugins
        bufferline = {
            n = {
                ["<M-h>"] = { "<cmd>BufferLineMovePrev<CR>" },
                ["<M-l>"] = { "<cmd>BufferLineMoveNext<CR>" },
            },
        },
    },

    telescope = {
        toggle_preview = "<A-p>",
        close = "<C-c>",
        open_with_trouble = "<C-t>",
    },
    treesitter = {
        init_selection = "<C-s>",
        node_incremental = "<C-s>l",
        scope_incremental = "<C-s>",
        node_decremental = "<C-s>h",
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
            ["<leader>sn"] = "@parameter.inner",
        },
        swap_previous = {
            ["<leader>sp"] = "@parameter.inner",
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
    lsp_signature = {
        toggle = "<C-s>",
    },
    cmp = {
        scroll_docs_up = "<C-u>",
        scroll_docs_down = "<C-d>",
        open_complete = "<C-z>",
        disable_default = "<C-y>",
        abort = "<C-e>",
        prev_item = "<C-p>",
        next_item = "<C-n>",
        tab = "<Tab>",
        shift_tab = "<S-Tab>",
    },
}


local M = {
    plugins = mappings.plugins,

    set_keymap = function(mode, key, command, options)
        if options == nil then
            options = {}
        end
        if options.noremap == nil then
            -- disables recursive mapping
            options.noremap = true
        end
        if options.silent == nil then
            -- enable silent mapping; the command entered would not be echoed
            options.silent = true
        end
        if options.expr == nil then
            -- disable evaluation
            options.expr = false
        end

        vim.keymap.set(mode, key, command, options)
    end,

    register = function(self)
        -- all key modes, see map-modes in vimdoc
        local modes = { "", "n", "i", "v", "x", "c", "t", "o" }
        local default_mappings = mappings["default"]
        for _, mode in ipairs(modes) do
            if default_mappings[mode] ~= nil then
                for key, val in pairs(default_mappings[mode]) do
                    if #val == 1 then
                        cmd = val[1]
                        self.set_keymap(mode, key, cmd)
                    else
                        cmd = val[1]
                        opts = val[2]
                        self.set_keymap(mode, key, cmd, opts)
                    end
                end
            end
        end
    end,
}

return M

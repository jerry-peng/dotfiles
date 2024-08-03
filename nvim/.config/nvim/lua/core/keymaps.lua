local gitsigns = require("gitsigns")

local mappings = {}
mappings["direct"] = {}
mappings["passthrough"] = {}

-- normal/visual/select/operator-pending
mappings["direct"][""] = {}

-- normal
mappings["direct"]["n"] = {
    -- more natural movement with wrap on
    j = { [[v:count == 0 ? "gj" : "j"]], { expr = true } },
    k = { [[v:count == 0 ? "gk" : "k"]], { expr = true } },

    -- H/L move to start/end of line
    H = { "^" },
    L = { "$" },

    -- override ? to use sane regexes (not used since we have auto-completion)
    ["/"] = { "/\\v" },

    -- window adjustment
    ["<Up>"] = { "<C-w>-" },
    ["<Down>"] = { "<C-w>+" },
    ["<Left>"] = { "<C-w><" },
    ["<Right>"] = { "<C-w>>" },

    -- clipboard copy/paste
    ["<M-y>"] = { [["*y]] },
    ["<M-y><M-y>"] = { [["*yy]] },
    ["<M-p>"] = { [["*p]] },

    -- clear search highlight
    ["<leader>c"] = { ":noh<CR>" },

    -- plugin: markdown-preview.nvim
    ["<M-m>"] = { "<cmd>MarkdownPreview<CR>" },

    -- plugin: nvim-tree.lua
    ["<M-n>"] = { "<cmd>NvimTreeToggle<CR>" },

    -- plugin: dial.nvim
    ["<C-a>"] = {
        function()
            require("dial.map").manipulate("increment", "normal")
        end,
        { noremap = false },
    },
    ["<C-x>"] = {
        function()
            require("dial.map").manipulate("decrement", "normal")
        end,
        { noremap = false },
    },

    -- plugin: vim-bbye
    ["<M-q>"] = { "<cmd>Bdelete<CR>" },
    ["<M-Q>"] = { "<cmd>Bdelete!<CR>" },

    -- plugin: nvim-spider
    ["w"] = { [[<cmd>lua require("spider").motion("w")<CR>]] },
    ["b"] = { [[<cmd>lua require("spider").motion("b")<CR>]] },
    ["e"] = { [[<cmd>lua require("spider").motion("e")<CR>]] },
    ["ge"] = { [[<cmd>lua require("spider").motion("ge")<CR>]] },

    -- plugin: gitsigns.nvim
    -- use "[c" and "]c" in diff mode, otherwise use gitsigns to jump to hunk
    ["]c"] = {
        function()
            if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
            else
                gitsigns.nav_hunk("next")
            end
        end,
    },
    ["[c"] = {
        function()
            if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
            else
                gitsigns.nav_hunk("prev")
            end
        end,
    },

    -- plugin: nvim-hlslens
    ["n"] = {
        [[<Cmd>execute("normal! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>]],
        { noremap = true, silent = true },
    },
    ["N"] = {
        [[<Cmd>execute("normal! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>]],
        { noremap = true, silent = true },
    },
    ["*"] = { [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true } },
    ["#"] = { [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true } },
    ["g*"] = { [[g*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true } },
    ["g#"] = { [[g#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true } },

    -- plugin: oil.nvim
    ["-"] = { "<cmd>Oil<CR>" },

    -- plugin: bufferline.nvim
    ["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>" },
    ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>" },

    ["<leader>bh"] = { "<cmd>BufferLineCloseLeft<CR>" },
    ["<leader>bl"] = { "<cmd>BufferLineCloseRight<CR>" },
    ["<leader>bb"] = { "<cmd>BufferLinePick<CR>" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<CR>" },
    ["<leader>be"] = { "<cmd>BufferLineSortByExtension<CR>" },
    ["<leader>bd"] = { "<cmd>BufferLineSortByDirectory<CR>" },

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
    ["<leader>fp"] = {
        function()
            require("telescope").extensions.projects.projects({})
        end,
    },

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

-- operator-pending
mappings["direct"]["o"] = {
    al = { "<cmd>norm val<CR>" },
    il = { "<cmd>norm vil<CR>" },

    -- plugin: nvim-spider
    ["w"] = { [[<cmd>lua require("spider").motion("w")<CR>]] },
    ["b"] = { [[<cmd>lua require("spider").motion("b")<CR>]] },
    ["e"] = { [[<cmd>lua require("spider").motion("e")<CR>]] },
    ["ge"] = { [[<cmd>lua require("spider").motion("ge")<CR>]] },

    -- plugin: leap.nvim
    -- ["s"] = { "<Plug>(leap-forward)" },
    -- ["S"] = { "<Plug>(leap-backward)" },
}

-- visual
mappings["direct"]["x"] = {
    -- when line is wrapped, j/k moves between visual lines
    j = { [[v:count == 0 ? "gj" : "j"]], { expr = true } },
    k = { [[v:count == 0 ? "gk" : "k"]], { expr = true } },

    -- sane regexes
    ["/"] = { "/\\v" },

    -- line text objects
    il = { "g_o^" },

    -- reselect after indent/outdent
    ["<"] = { "<gv" },
    [">"] = { ">gv" },

    -- clipboard copy/paste
    ["<M-y>"] = { [["*y]] },
    ["<M-p>"] = { [["*p]] },

    -- plugin: vim-unimpaired; reselect after unimpaired move selection up/down
    ["[e"] = { "<Plug>(unimpaired-move-selection-up)gv" },
    ["]e"] = { "<Plug>(unimpaired-move-selection-down)gv" },

    -- plugin: nvim-spider
    ["w"] = { [[<cmd>lua require("spider").motion("w")<CR>]] },
    ["b"] = { [[<cmd>lua require("spider").motion("b")<CR>]] },
    ["e"] = { [[<cmd>lua require("spider").motion("e")<CR>]] },
    ["ge"] = { [[<cmd>lua require("spider").motion("ge")<CR>]] },

    -- plugin: dial.nvim
    ["<C-a>"] = {
        function()
            require("dial.map").manipulate("increment", "visual")
        end,
        { noremap = false },
    },
    ["<C-x>"] = {
        function()
            require("dial.map").manipulate("decrement", "visual")
        end,
        { noremap = false },
    },
    ["g<C-a>"] = {
        function()
            require("dial.map").manipulate("increment", "gvisual")
        end,
        { noremap = false },
    },
    ["g<C-x>"] = {
        function()
            require("dial.map").manipulate("decrement", "gvisual")
        end,
        { noremap = false },
    },

    -- plugin: leap.nvim
    -- ["s"] = { "<Plug>(leap-forward)" },
    -- ["S"] = { "<Plug>(leap-backward)" },

    ["<leader>ds"] = { '<ESC>:lua require("dap-python").debug_selection()<CR>' },

    ["<leader>re"] = { '<Esc><Cmd>lua require("refactoring").refactor("Extract Function")<CR>' },
    ["<leader>rf"] = { '<Esc><Cmd>lua require("refactoring").refactor("Extract Function To File")<CR>' },
    ["<leader>rv"] = { '<Esc><Cmd>lua require("refactoring").refactor("Extract Variable")<CR>' },
    ["<leader>ri"] = { '<Esc><Cmd>lua require("refactoring").refactor("Inline Variable")<CR>' },

    ["<leader>ss"] = { ":'<,'>SnipRun<CR>" },
    ["<leader>lc"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>" },
}

-- insert/command
mappings["direct"]["i"] = {
    ["<C-p>"] = { "<C-r>*" }, -- paste from clipboard

    -- plugin: nvim-spider
    ["<C-w>"] = { [[<Esc>l<cmd>lua require("spider").motion("w")<CR>i]] },
    ["<C-r>"] = { [[<Esc><cmd>lua require("spider").motion("b")<CR>i]] },
}

-- command
mappings["direct"]["c"] = {
    ["<C-a>"] = { "<home>" },
    ["<C-e>"] = { "<end>" },
}

-- Plugin key configurations that is registered through plugin setup
mappings["passthrough"] = {
    after = {
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
        open_trouble = "<C-t>",
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
    passthrough = mappings.passthrough,

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
        local default_mappings = mappings["direct"]
        for _, mode in ipairs(modes) do
            if default_mappings[mode] ~= nil then
                for key, val in pairs(default_mappings[mode]) do
                    if #val == 1 then
                        local cmd = val[1]
                        self.set_keymap(mode, key, cmd)
                    else
                        local cmd = val[1]
                        local opts = val[2]
                        self.set_keymap(mode, key, cmd, opts)
                    end
                end
            end
        end
    end,
}

return M

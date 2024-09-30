-- Direct keymap assignments
local direct_mappings = {}

-- normal/visual/select/operator-pending
direct_mappings[""] = {}

-- normal
direct_mappings["n"] = {
    -- more natural movement with wrap on
    j = { [[v:count == 0 ? "gj" : "j"]], { expr = true } },
    k = { [[v:count == 0 ? "gk" : "k"]], { expr = true } },

    -- H/L move to start/end of line
    H = { "^" },
    L = { "$" },

    -- override ? to use sane regexes.
    -- Using ? instead of / because flash.nvim search integration does not work if sane regexes is enabled
    ["?"] = { "/\\v" },

    -- window pane adjustment
    ["<M-Up>"] = { "<cmd>resize +5<CR>" },
    ["<M-Down>"] = { "<cmd>resize -5<CR>" },
    ["<M-Left>"] = { "<cmd>vertical resize -5<CR>" },
    ["<M-Right>"] = { "<cmd>vertical resize +5<CR>" },
    ["<M-->"] = { "<c-w>=" }, -- shrink pane
    ["<M-=>"] = { "<C-w><Bar><C-w>_<CR>" }, -- enlarge pane

    -- clipboard copy/paste
    ["<M-y>"] = { [["*y]] },
    ["<M-y><M-y>"] = { [["*yy]] },
    ["<M-p>"] = { [["*p]] },

    -- clear search highlight
    ["<M-c>"] = { ":noh<CR>" },

    -- Send search results to quickfix list
    ["<leader>/"] = { [[<cmd>execute "vimgrep /".@/."/g %"<CR>]] },

    -- plugin: undotree
    ["<M-u>"] = { vim.cmd.UndotreeToggle },

    -- plugin: markdown-preview.nvim
    ["<M-m>"] = { "<cmd>MarkdownPreview<CR>" },
    [",t"] = { "<cmd>RenderMarkdown toggle<CR>" },

    -- plugin: gitsigns.nvim
    -- use "[c" and "]c" in diff mode, otherwise use gitsigns to jump to hunk
    ["]c"] = {
        function()
            if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
            else
                require("gitsigns").nav_hunk("next")
            end
        end,
    },
    ["[c"] = {
        function()
            if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
            else
                require("gitsigns").nav_hunk("prev")
            end
        end,
    },

    -- plugin: diffview.nvim
    ["<leader>gf"] = { "<cmd>DiffviewOpen<CR>" },
    ["<leader>gc"] = { "<cmd>DiffviewClose<CR>" },
    ["<leader>gh"] = { "<cmd>DiffviewFileHistory<CR>" },

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
    ["<leader>q"] = { "<cmd>Bdelete<CR><cmd>q<CR>" },
    ["<leader>Q"] = { "<cmd>Bdelete!<CR><cmd>q<CR>" },

    -- plugin: nvim-spider
    ["<M-l>"] = { [[<cmd>lua require("spider").motion("w")<CR>]] },
    ["<M-h>"] = { [[<cmd>lua require("spider").motion("b")<CR>]] },
    ["<M-k>"] = { [[<cmd>lua require("spider").motion("e")<CR>]] },
    ["<M-j>"] = { [[<cmd>lua require("spider").motion("ge")<CR>]] },

    -- plugin: flash.nvim
    ["s"] = {
        function()
            require("flash").jump()
        end,
    },
    ["S"] = {
        function()
            require("flash").treesitter()
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
    ["*"] = { [[*<Cmd>lua require("hlslens").start()<CR>]], { noremap = true, silent = true } },
    ["#"] = { [[#<Cmd>lua require("hlslens").start()<CR>]], { noremap = true, silent = true } },
    ["g*"] = { [[g*<Cmd>lua require("hlslens").start()<CR>]], { noremap = true, silent = true } },
    ["g#"] = { [[g#<Cmd>lua require("hlslens").start()<CR>]], { noremap = true, silent = true } },

    -- plugin: oil.nvim
    ["-"] = { "<cmd>Oil<CR>" },

    -- plugin: grapple.nvim
    ["<M-t>"] = { require("grapple").toggle },
    ["<M-g>"] = { require("grapple").open_tags },
    ["<M-]>"] = { "<cmd>Grapple cycle_tags next<cr>" },
    ["<M-[>"] = { "<cmd>Grapple cycle_tags prev<cr>" },
    ["<M-1>"] = { "<cmd>Grapple select index=1<cr>" },
    ["<M-2>"] = { "<cmd>Grapple select index=2<cr>" },
    ["<M-3>"] = { "<cmd>Grapple select index=3<cr>" },
    ["<M-4>"] = { "<cmd>Grapple select index=4<cr>" },
    ["<M-5>"] = { "<cmd>Grapple select index=5<cr>" },
    ["<M-6>"] = { "<cmd>Grapple select index=6<cr>" },
    ["<M-7>"] = { "<cmd>Grapple select index=7<cr>" },
    ["<M-8>"] = { "<cmd>Grapple select index=8<cr>" },
    ["<M-9>"] = { "<cmd>Grapple select index=9<cr>" },

    -- plugin: bufferline.nvim
    ["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>" },
    ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>" },
    ["<leader>bj"] = { "<cmd>BufferLineCloseLeft<CR>" },
    ["<leader>bk"] = { "<cmd>BufferLineCloseRight<CR>" },
    ["<leader>bh"] = { "<cmd>BufferLineMovePrev<CR>" },
    ["<leader>bl"] = { "<cmd>BufferLineMoveNext<CR>" },
    ["<leader>bb"] = { "<cmd>BufferLinePick<CR>" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<CR>" },
    ["<leader>be"] = { "<cmd>BufferLineSortByExtension<CR>" },
    ["<leader>bd"] = { "<cmd>BufferLineSortByDirectory<CR>" },
    ["<leader>1"] = { [[<cmd>lua require("bufferline").go_to(1, true)<cr>]] },
    ["<leader>2"] = { [[<cmd>lua require("bufferline").go_to(2, true)<cr>]] },
    ["<leader>3"] = { [[<cmd>lua require("bufferline").go_to(3, true)<cr>]] },
    ["<leader>4"] = { [[<cmd>lua require("bufferline").go_to(4, true)<cr>]] },
    ["<leader>5"] = { [[<cmd>lua require("bufferline").go_to(5, true)<cr>]] },
    ["<leader>6"] = { [[<cmd>lua require("bufferline").go_to(6, true)<cr>]] },
    ["<leader>7"] = { [[<cmd>lua require("bufferline").go_to(7, true)<cr>]] },
    ["<leader>8"] = { [[<cmd>lua require("bufferline").go_to(8, true)<cr>]] },
    ["<leader>9"] = { [[<cmd>lua require("bufferline").go_to(9, true)<cr>]] },

    -- plugin: telescope.nvim
    ["<leader>fb"] = { [[<cmd>lua require("telescope.builtin").builtin()<CR>]] },
    ["<leader>fr"] = { [[<cmd>lua require("telescope.builtin").resume()<CR>]] },
    ["<leader>ff"] = { [[<cmd>lua require("telescope.builtin").find_files()<CR>]] },
    ["<leader>fd"] = { [[<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>]] },
    ["<leader>fe"] = { [[<cmd>lua require("telescope.builtin").grep_string()<CR>]] },
    ["<leader>fg"] = { [[<cmd>lua require("telescope.builtin").git_files()<CR>]] },
    ["<leader>fl"] = { [[<cmd>lua require("telescope.builtin").live_grep()<CR>]] },
    ["<leader>f/"] = { [[<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>]] },
    ["<leader>fh"] = { [[<cmd>lua require("telescope.builtin").help_tags()<CR>]] },
    ["<leader>fc"] = { [[<cmd>lua require("telescope.builtin").commands()<CR>]] },
    ["<leader>fx"] = { [[<cmd>lua require("telescope.builtin").command_history()<CR>]] },
    ["<leader>fs"] = { [[<cmd>lua require("telescope.builtin").search_history()<CR>]] },
    ["<leader>fq"] = { [[<cmd>lua require("telescope.builtin").quickfix()<CR>]] },
    ["<leader>fw"] = { [[<cmd>lua require("telescope.builtin").quickfixhistory()<CR>]] },

    -- plugin: projects.nvim extension for telescope.nvim
    ["<leader>fp"] = {
        function()
            require("telescope").extensions.projects.projects({})
        end,
    },
    -- plugin: grapple.nvim extension for telescope.nvim
    ["<leader>ft"] = { "<cmd>Telescope grapple tags<CR>" },
    -- plugin: aerial.nvim extension for telescope.nvim
    ["<leader>fa"] = { "<cmd>Telescope aerial<CR>" },

    -- plugin: nvim-treesitter-textobjects
    ["<M-;>"] = { require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_next },
    ["<M-,>"] = { require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_previous },

    -- plugin: treesj
    [",j"] = { [[<cmd>lua require("treesj").toggle()<CR>]] },

    -- plugin: refactoring.nvim
    ["<M-r>"] = {
        function()
            require("telescope").extensions.refactoring.refactors()
        end,
    },

    -- plugin: aerial.nvim
    ["<M-a>"] = { "<cmd>AerialToggle!<CR>" },
    ["{"] = { "<cmd>AerialPrev<CR>" },
    ["}"] = { "<cmd>AerialNext<CR>" },

    -- plugin: neogen.lua
    [",a"] = {
        function()
            require("neogen").generate()
        end,
    },

    -- plugin: nvim-lspconfig
    gd = { "<cmd>lua vim.lsp.buf.declaration()<CR>" },
    gr = { "<cmd>lua vim.lsp.buf.references()<CR>" },
    gi = { "<cmd>lua vim.lsp.buf.implementation()<CR>" },
    ["<leader>la"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" },
    ["<leader>ld"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
    ["<leader>ll"] = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" },
    ["<leader>lt"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
    ["<leader>lr"] = { ":IncRename " }, -- plugin: inc-rename.nvim
    ["<leader>lc"] = {
        function()
            -- plugin: actions-preview.nvim
            require("actions-preview").code_actions()
        end,
    },
    ["<leader>dd"] = { "<cmd>lua vim.diagnostic.open_float()<CR>" },
    ["<leader>dq"] = { "<cmd>lua vim.diagnostic.setqflist()<CR>" },

    -- plugin: trouble.nvim
    ["<leader>uu"] = { "<cmd>Trouble<cr>" },
    ["<leader>ud"] = { "<cmd>Trouble diagnostics toggle win.size=0.3<cr>" },
    ["<leader>uc"] = { "<cmd>Trouble diagnostics toggle filter.buf=0 win.size=0.3<cr>" },
    ["<leader>us"] = { "<cmd>Trouble symbols toggle focus=false win.size=0.3<cr>" },
    ["<leader>ul"] = { "<cmd>Trouble lsp toggle focus=false win.size=0.3<cr>" },
    ["<leader>uq"] = { "<cmd>Trouble qflist toggle win.size=0.3<cr>" },

    -- plugin: sniprun
    ["<leader>ss"] = { "<cmd>SnipRun<CR>" },
    ["<leader>sr"] = { "<cmd>SnipReset<CR>" },
    ["<leader>sc"] = { "<cmd>SnipClose<CR>" },
    ["<leader>sm"] = { "<cmd>SnipReplMemoryClean<CR>" },

    -- plugin: neotest
    ["<leader>tt"] = {
        function()
            require("neotest").run.run()
        end,
    },
    ["<leader>tf"] = {
        function()
            require("neotest").run.run(vim.fn.expand("%"))
        end,
    },
    ["<leader>tl"] = {
        function()
            require("neotest").run.run_last()
        end,
    },
    ["<leader>tdt"] = {
        function()
            require("neotest").run.run({ strategy = "dap" })
        end,
    },
    ["<leader>tdf"] = {
        function()
            require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
        end,
    },
    ["<leader>tdl"] = {
        function()
            require("neotest").run.run_last({ strategy = "dap" })
        end,
    },
    ["<leader>tx"] = {
        function()
            require("neotest").run.stop()
        end,
    },
    ["<leader>ta"] = {
        function()
            require("neotest").run.attach()
        end,
    },
    ["<leader>ts"] = {
        function()
            require("neotest").summary.toggle()
        end,
    },
    ["<leader>to"] = {
        function()
            require("neotest").output.open()
        end,
    },
    ["<leader>tp"] = {
        function()
            require("neotest").output_panel.toggle()
        end,
    },

    -- plugin: nvim-coverage
    ["<leader>cc"] = { "<cmd>Coverage<CR>" },
    ["<leader>ct"] = { "<cmd>CoverageToggle<CR>" },
    ["<leader>cs"] = { "<cmd>CoverageSummary<CR>" },

    -- plugin: nvim-dap
    ["<leader>db"] = {
        function()
            require("dap").toggle_breakpoint()
        end,
    },
    ["<leader>dx"] = {
        function()
            require("dap").terminate()
        end,
    },
    ["<leader>dh"] = {
        function()
            require("dap.ui.widgets").hover()
        end,
    },
    ["<leader>dp"] = {
        function()
            require("dap.ui.widgets").preview()
        end,
    },
    ["<F5>"] = {
        function()
            require("dap").continue()
        end,
    },
    ["<F9>"] = {
        function()
            require("dap").step_back()
        end,
    },
    ["<F10>"] = {
        function()
            require("dap").step_into()
        end,
    },
    ["<F11>"] = {
        function()
            require("dap").step_over()
        end,
    },
    ["<F12>"] = {
        function()
            require("dap").step_out()
        end,
    },

    -- plugin: nvim-dap-ui
    ["<leader>du"] = {
        function()
            require("dapui").toggle()
        end,
    },
}

-- operator-pending
direct_mappings["o"] = {
    al = { "<cmd>norm val<CR>" },
    il = { "<cmd>norm vil<CR>" },

    -- plugin: nvim-spider
    ["<M-l>"] = { [[<cmd>lua require("spider").motion("w")<CR>]] },
    ["<M-h>"] = { [[<cmd>lua require("spider").motion("b")<CR>]] },
    ["<M-k>"] = { [[<cmd>lua require("spider").motion("e")<CR>]] },
    ["<M-j>"] = { [[<cmd>lua require("spider").motion("ge")<CR>]] },

    -- plugin: flash.nvim
    ["s"] = {
        function()
            require("flash").jump()
        end,
    },
    ["S"] = {
        function()
            require("flash").treesitter()
        end,
    },
    ["r"] = {
        function()
            require("flash").remote()
        end,
    },
    ["R"] = {
        function()
            require("flash").treesitter_search()
        end,
    },

    -- plugin: nvim-treesitter-textobjects
    ["<M-;>"] = { require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_next },
    ["<M-,>"] = { require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_previous },
}

-- visual
direct_mappings["x"] = {
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
    ["<M-l>"] = { [[<cmd>lua require("spider").motion("w")<CR>]] },
    ["<M-h>"] = { [[<cmd>lua require("spider").motion("b")<CR>]] },
    ["<M-k>"] = { [[<cmd>lua require("spider").motion("e")<CR>]] },
    ["<M-j>"] = { [[<cmd>lua require("spider").motion("ge")<CR>]] },

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

    -- plugin: flash.nvim
    ["s"] = {
        function()
            require("flash").jump()
        end,
    },
    ["S"] = {
        function()
            require("flash").treesitter()
        end,
    },
    ["R"] = {
        function()
            require("flash").treesitter_search()
        end,
    },

    -- plugin: nvim-treesitter-textobjects
    ["<M-;>"] = { require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_next },
    ["<M-,>"] = { require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_previous },

    -- plugin: refactoring.nvim
    ["<M-r>"] = {
        function()
            require("telescope").extensions.refactoring.refactors()
        end,
    },

    ["<leader>re"] = { '<Esc><Cmd>lua require("refactoring").refactor("Extract Function")<CR>' },
    ["<leader>rf"] = { '<Esc><Cmd>lua require("refactoring").refactor("Extract Function To File")<CR>' },
    ["<leader>rv"] = { '<Esc><Cmd>lua require("refactoring").refactor("Extract Variable")<CR>' },
    ["<leader>ri"] = { '<Esc><Cmd>lua require("refactoring").refactor("Inline Variable")<CR>' },

    -- plugin: sniprun
    ["<leader>ss"] = { ":'<,'>SnipRun<CR>" },

    -- plugin: actions-preview.nvim
    ["<leader>lc"] = {
        function()
            require("actions-preview").code_actions()
        end,
    },
}

-- insert/command
direct_mappings["i"] = {
    ["<C-p>"] = { "<C-r>*" }, -- paste from clipboard

    -- easier vertical movement in insert mode
    ["<C-j>"] = { "<Down>" },
    ["<C-k>"] = { "<Up>" },

    -- plugin: nvim-spider
    ["<M-l>"] = { [[<cmd>lua require("spider").motion("w")<CR>]] },
    ["<M-h>"] = { [[<cmd>lua require("spider").motion("b")<CR>]] },
    ["<M-k>"] = { [[<cmd>lua require("spider").motion("e")<CR><Right>]] },
    ["<M-j>"] = { [[<Left><cmd>lua require("spider").motion("ge")<CR><Right>]] },

    -- toggle global autocomplete flag
    ["<C-c>"] = {
        function()
            vim.g.cmp_enabled = not vim.g.cmp_enabled
        end,
    },
}

-- command
direct_mappings["c"] = {
    -- <C-/> is registered as <C-_> in vim
    ["<C-_>"] = {
        function()
            require("flash").toggle()
        end,
    },
}

local M = {
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
        local default_mappings = direct_mappings
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

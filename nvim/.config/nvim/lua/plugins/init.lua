-- imported by lazy
return {
    -- utilities
    "christoomey/vim-tmux-navigator", -- navigate between vim windows and tmux panes
    "tpope/vim-repeat", -- add `.` repeat on some other tpope
    "tpope/vim-unimpaired", -- useful mappings by tpope
    "tpope/vim-sleuth", -- auto-detect tab length
    "mbbill/undotree", -- undo history visualizer
    {
        "chrisgrieser/nvim-early-retirement", -- removes buffer after x minutes of inactivity
        config = true,
        event = "VeryLazy",
    },

    -- tools
    {
        "iamcco/markdown-preview.nvim", -- preview markdown
        build = "cd app && yarn install",
        ft = "markdown",
    },
    {
        "MeanderingProgrammer/render-markdown.nvim", -- renders markdown in Neovim
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
            "maxmx03/solarized.nvim", -- Load after color scheme
        },
        config = function()
            require("plugins.config.render-markdown").config()
        end,
    },
    {
        -- sets working directory to git root automatically
        "ahmedkhalf/project.nvim", -- project management
        config = function()
            require("project_nvim").setup()
        end,
    },

    -- git
    "tpope/vim-fugitive", -- GOAT git integration plugin
    {
        "lewis6991/gitsigns.nvim", -- shows git diffs in sign column
        config = function()
            require("plugins.config.gitsigns").config()
        end,
    },
    {
        "sindrets/diffview.nvim", -- git diff and history viewer
        config = function()
            require("plugins.config.diffview").config()
        end,
    },

    -- editing
    {
        "monaqa/dial.nvim", -- inc/dec extension plugin
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("plugins.config.dial").config()
        end,
    },
    {
        "numToStr/Comment.nvim", -- comment plugin
        dependencies = {
            -- for files with multiple languages (e.g. jsx), set comment string based on cursor location
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require("plugins.config.comment").config()
        end,
    },
    {
        "kylechui/nvim-surround", -- nvim surround utilities
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "windwp/nvim-autopairs", -- auto pairing quotes and braces
        dependencies = {},
        config = function()
            require("plugins.config.autopairs").config()
        end,
    },

    -- motion
    {
        "chrisgrieser/nvim-spider", -- motion within sub-words
        lazy = true,
        config = function()
            require("plugins.config.spider").config()
        end,
    },
    "folke/flash.nvim", -- enables easier code jumps

    -- search
    {
        "kevinhwang91/nvim-hlslens", -- enhanced search highlighting
        config = function()
            require("hlslens").setup()
        end,
    },

    -- theme
    {
        "maxmx03/solarized.nvim", -- GOAT theme
        version = "2.3.0",
        config = function()
            require("plugins.config.solarized").config()
        end,
    },

    -- UI
    {
        "norcalli/nvim-colorizer.lua", -- colorize background of color hex
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "nvim-tree/nvim-web-devicons", -- icons for filetypes, etc
        config = function()
            vim.o.background = "light" -- Devicons colors are set based on background color
            require("nvim-web-devicons").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim", -- indent guide
        dependencies = {
            "HiPhish/rainbow-delimiters.nvim", -- Rainbow delimiters for nested bracces
        },
        config = function()
            require("plugins.config.indent-blankline").config()
        end,
    },
    {
        "nvim-lualine/lualine.nvim", -- enhanced status line
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.config.lualine").config()
        end,
    },
    "stevearc/dressing.nvim", -- enhanced input/select window using telescope

    -- files
    {
        "kyazdani42/nvim-tree.lua", -- file tree
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.config.nvimtree").config()
        end,
    },
    {
        "stevearc/oil.nvim", -- file tree manipulation
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup()
        end,
    },
    {
        "cbochs/grapple.nvim", -- file tagging
        dependencies = {
            { "nvim-tree/nvim-web-devicons", lazy = true },
        },
        config = function()
            require("grapple").setup()
            require("grapple").prune() -- prune tag save files older than 30d
        end,
    },

    -- buffers
    {
        "akinsho/bufferline.nvim", -- buffer line
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "moll/vim-bbye", -- delete buffer without closing window
            "maxmx03/solarized.nvim", -- Load after color scheme
        },
        config = function()
            require("plugins.config.bufferline").config()
        end,
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim", -- fuzzy finder + UI
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "folke/trouble.nvim",
        },
        config = function()
            require("plugins.config.telescope").config()
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim", -- wrapper for native fzf
        build = "make",
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter", -- syntax highlighting
        build = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter").config()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects", -- text objects based on treesitter AST
    },
    {
        "Wansmer/treesj", -- smart code split/join using treesitter
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "romgrk/nvim-treesitter-context", -- show code context using treesitter
        config = function()
            require("treesitter-context").setup()
        end,
    },
    {
        "windwp/nvim-ts-autotag", -- autoclose/autorename html tag using treesitter
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "RRethy/nvim-treesitter-endwise", -- auto-append `end` for some languages (ruby/lua, etc) using treesitter
        config = function()
            require("plugins.config.treesitter-endwise").config()
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim", -- refactoring library using treesitter
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },
    {
        "stevearc/aerial.nvim", -- code outline window using treesitter, LSP as fallback
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
            "maxmx03/solarized.nvim", -- Load after color scheme
        },
        config = function()
            require("plugins.config.aerial").config()
        end,
    },
    {
        "RRethy/vim-illuminate", -- highlight identical symnbols
        dependencies = {
            "maxmx03/solarized.nvim", -- Load after color scheme
        },
        config = function()
            require("illuminate").configure({})
        end,
    },
    {
        "danymat/neogen",
        config = function()
            require("plugins.config.neogen").config() -- comment annotation generator using treesitter
        end,
    },

    -- LSP/linters/formatters
    {
        "williamboman/mason.nvim", -- mason tool registry + UI (LSP/lintersformatters)
        config = function()
            require("mason").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- installer for mason tools
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("plugins.config.mason-tools").config()
        end,
    },
    {
        "stevearc/conform.nvim", -- formatting tool, automatically configures formatters
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("plugins.config.conform").config()
        end,
    },
    {
        "mfussenegger/nvim-lint", -- linting tool, automatically configures linters
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("plugins.config.nvim-lint").config()
        end,
    },
    {
        "williamboman/mason-lspconfig", -- bridges mason and lspconfig, helps setup LSPs
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("plugins.config.lspconfig").config()
        end,
    },

    -- completion
    {
        "hrsh7th/nvim-cmp", -- auto-completion
        config = function()
            require("plugins.config.cmp").config()
        end,
    },
    "hrsh7th/cmp-nvim-lsp", -- LSP source for completion
    "hrsh7th/cmp-buffer", -- buffer source for completion
    "hrsh7th/cmp-path", -- path source for completion
    "hrsh7th/cmp-cmdline", -- command line source for completion
    "hrsh7th/cmp-nvim-lsp-signature-help", -- source for function signature help
    "onsails/lspkind.nvim", -- kind icons in auto-completion entries

    -- snippets
    {
        "L3MON4D3/LuaSnip", -- snippet library
        version = "v2.*",
        build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- luasnip source for completion
    "rafamadriz/friendly-snippets", -- sensible default snippets

    -- LSP enhancements
    "arkav/lualine-lsp-progress", -- show LSP index progress in statusline
    {
        "folke/trouble.nvim", -- prettier diagnostics/references/telescope results/qflist/location list
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        -- TODO: need more configuration
        "mrcjkb/rustaceanvim", -- adds additional non-standard features specific to rust-analyzer
        version = "^4",
        ft = { "rust" },
    },
    {
        "smjonas/inc-rename.nvim", -- incremental rename
        config = function()
            require("plugins.config.inc-rename").config()
        end,
    },
    {
        "kosayoda/nvim-lightbulb", -- show symbol when a line has code action
        config = function()
            require("plugins.config.lightbulb").config()
        end,
    },
    {
        "aznhe21/actions-preview.nvim", -- show code action preview
        config = function()
            require("actions-preview").setup({})
        end,
    },
    {
        "utilyre/barbecue.nvim", -- show code breadcrumbs in winbar
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
            "maxmx03/solarized.nvim", -- Load after color scheme
        },
        config = function()
            require("plugins.config.barbecue").config()
        end,
    },

    -- code runner/REPL
    {
        "michaelb/sniprun", -- code runner that can run partial code
        build = "bash ./install.sh",
        config = function()
            require("plugins.config.sniprun").config()
        end,
    },
    {
        "Olical/conjure", -- interactive evaluation
        config = function()
            require("plugins.config.conjure").config()
        end,
    },

    -- testing
    {
        "nvim-neotest/neotest", -- test runner
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "vim-test/vim-test",
            -- Adapters
            "nvim-neotest/neotest-vim-test",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-jest",
            "mrcjkb/rustaceanvim",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require("plugins.config.neotest").config()
        end,
    },
    {
        "andythigpen/nvim-coverage", -- displays unit test coverage information in sign column
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("plugins.config.coverage").config()
        end,
    },

    -- DAP
    {
        "jay-babu/mason-nvim-dap.nvim", -- bridges mason and nvim-dap, helps setup LSPs
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            require("plugins.config.dap").config()
        end,
    },
    {
        "rcarriga/nvim-dap-ui", -- UI for nvim-dap
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
    },
}

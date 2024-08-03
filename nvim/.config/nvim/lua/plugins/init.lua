return {
    -- utilities
    "christoomey/vim-tmux-navigator", -- integrated vim/tmux navigation
    "tpope/vim-repeat", -- add `.` repeat on some other tpope plugins
    "tpope/vim-unimpaired", -- useful mappings by tpope
    "tpope/vim-sleuth", -- auto-detect tab length

    -- tools
    {
        "iamcco/markdown-preview.nvim", -- preview markdown
        build = "cd app && yarn install",
        ft = "markdown",
    },
    {
        -- sets working directory to git root automatically
        "ahmedkhalf/project.nvim", -- project management
        config = function()
            require("project_nvim").setup({})
        end,
    },

    -- git
    "tpope/vim-fugitive", -- best git integration plugin
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.config.gitsigns").config()
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
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

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
        config = function()
            require("plugins.config.colors").config()
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
            require("plugins.config.devicons").config()
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
    {
        "stevearc/dressing.nvim", -- enhanced input/select window using telescope
    },

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
        "cbochs/grapple.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", lazy = true },
        },
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
        "Wansmer/treesj",
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
    },
    {
        "RRethy/nvim-treesitter-endwise", -- auto-append `end` for some languages (ruby/lua, etc) using treesitter
        config = function()
            require("nvim-treesitter.configs").setup({ endwise = { enable = true } })
        end,
    },
    {
        "ckolkey/ts-node-action", -- framework for running actions on treesitter nodes
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("ts-node-action").setup()
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
        "nvimtools/none-ls.nvim", -- a LSP layer that allow other tools to inject diagnostics, code actions, etc.
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "plenary.nvim",
        },
        config = function()
            require("plugins.config.null-ls").config()
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
        "williamboman/mason-lspconfig.nvim", -- bridges mason and lspconfig, helps setup LSPs
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("plugins.config.lspconfig").config()
        end,
    },
    {
        "mrcjkb/rustaceanvim", -- adds additional non-standard features specific to rust-analyzer
        version = "^4",
        ft = { "rust" },
    },
    {
        "smjonas/inc-rename.nvim", -- incremental rename
        config = function()
            require("inc_rename").setup()
        end,
    },

    -- completion
    {
        "hrsh7th/nvim-cmp", -- auto-completion
        config = function()
            require("plugins.config.cmp").config()
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp", -- LSP source for completion
    },
    {
        "hrsh7th/cmp-buffer", -- buffer source for completion
    },
    {
        "hrsh7th/cmp-path", -- path source for completion
    },
    {
        "hrsh7th/cmp-cmdline", -- command line source for completion
    },

    -- snippets
    {
        "L3MON4D3/LuaSnip", -- snippet library
        version = "v2.*",
        build = "make install_jsregexp",
    },
    {
        "saadparwaiz1/cmp_luasnip", -- luasnip source for completion
    },
    {
        "rafamadriz/friendly-snippets", -- sensible default snippets
    },

    -- LSP UI
    {
        "ray-x/lsp_signature.nvim", -- LSP function signature hit
        config = function()
            require("plugins.config.lsp-signature").config()
        end,
    },
    {

        "arkav/lualine-lsp-progress", -- show LSP index progress in statusline
    },
    {

        "onsails/lspkind.nvim", -- kind icons in auto-completion entries
    },
    {
        "folke/trouble.nvim", -- prettier diagnostics/references/telescope results/qflist/location list
        config = function()
            require("trouble").setup({})
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
            require("coverage").setup()
        end,
    },

    -- DAP
    {
        "jay-babu/mason-nvim-dap.nvim", -- bridges mason and nvim-dap, helps setup LSPs
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("plugins.config.dap").config()
        end,
    },
    {
        "rcarriga/nvim-dap-ui", -- UI for DAP
        dependencies = {
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require("dapui").setup()
        end,
    },
    {
        "nvim-telescope/telescope-dap.nvim", -- DAP integration with telescope
    },
}

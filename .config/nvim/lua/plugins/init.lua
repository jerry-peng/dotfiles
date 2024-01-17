return {
    -- basic utilities
    "nathom/filetype.nvim",
    "christoomey/vim-tmux-navigator",

    -- other utilities
    "tpope/vim-repeat",
    "tpope/vim-unimpaired",

    -- git
    "tpope/vim-fugitive",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.config.gitsigns").config()
        end,
    },

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn install",
        ft = "markdown",
    },

    -- editing
    "matze/vim-move",
    {
        "monaqa/dial.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("plugins.config.dial").config()
        end,
        lazy = true
    },
    {
        "numToStr/Comment.nvim",
        dependencies = {
            -- for files with multiple languages (e.g. jsx), set comment string based on cursor location
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require("plugins.config.comment").config()
        end,
    },
    {
        "AckslD/nvim-trevJ.lua",
        config = function()
            require("trevj").setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },
    {
        "windwp/nvim-autopairs",
        dependencies = {
        },
        config = function()
            require("plugins.config.autopairs").config()
        end,
    },


    -- motion
    {
        "chrisgrieser/nvim-spider",
        config = function()
            require("spider").setup()
        end

    },
    {
        "phaazon/hop.nvim",
        config = function()
            require("hop").setup()
        end,
    },

    -- search
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("hlslens").setup()
        end,
    },

    -- theme
    {
        "maxmx03/solarized.nvim",
        config = function()
            require("plugins.config.colors").config()
        end,
    },

    -- UI
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = {
            "HiPhish/rainbow-delimiters.nvim", -- Rainbow delimiters for nested bracces
        },
        config = function()
            require("plugins.config.indent_blankline").config()
        end,
    },
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.config.nvimtree").config()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            "moll/vim-bbye", -- delete buffer without closing window
        },
        config = function()
            require("plugins.config.bufferline").config()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.config.lualine").config()
        end,
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        config = function()
            require("plugins.config.telescope").config()
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter").config()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "vim-unimpaired",
    },
    {
        "romgrk/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup()
        end,
    },
    "windwp/nvim-ts-autotag",
    {
        "RRethy/nvim-treesitter-endwise",
        config = function()
            require("nvim-treesitter.configs").setup({ endwise = { enable = true } })
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        config = function()
            require("refactoring").setup({})
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.config.lspconfig").config()
        end,
    },
    "arkav/lualine-lsp-progress",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    {
        "jose-elias-alvarez/null-ls.nvim",
        require = "plenary.nvim",
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("plugins.config.lsp_signature").config()
        end,
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- testing
    --[[ {
        "michaelb/sniprun",
        build = "bash ./install.sh",
        config = function()
            require("plugins.config.sniprun").config()
        end,
    }, ]]
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
        },
    },

    -- DAP
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("plugins.config.dap").config()
        end,
    },
    "nvim-telescope/telescope-dap.nvim",
    "mfussenegger/nvim-dap-python",
}

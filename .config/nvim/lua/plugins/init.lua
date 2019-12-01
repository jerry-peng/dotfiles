-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

-- auto-compile packer plugin list
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end   
]])

-- for loading opt packages
vim.cmd([[packadd packer.nvim]])
-- plugin list
return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- basic utilities
    use("nathom/filetype.nvim")
    use("christoomey/vim-tmux-navigator")

    -- other utilities
    use("tpope/vim-repeat")
    use("tpope/vim-unimpaired")
    use("kassio/neoterm")

    -- git
    use("tpope/vim-fugitive")
    use({
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("plugins.config.gitsigns").config()
        end,
    })

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        ft = "markdown",
    })

    -- edit
    use("monaqa/dial.nvim")
    use("matze/vim-move")
    use({
        "machakann/vim-sandwich",
        config = function()
            require("plugins.config.sandwich").config()
        end,
    })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("plugins.config.comment").config()
        end,
    })
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.config.autopairs").config()
        end,
    })
    use({
        "AckslD/nvim-revJ.lua",
        requires = { "kana/vim-textobj-user", "sgur/vim-textobj-parameter" },
        config = function()
            require("plugins.config.revj").config()
        end,
    })

    -- motion
    use("bkad/CamelCaseMotion")
    use({
        "phaazon/hop.nvim",
        config = function()
            require("hop").setup()
        end,
    })

    -- search
    use("kevinhwang91/nvim-hlslens")

    -- theme
    use({
        "ishan9299/nvim-solarized-lua",
        config = function()
            require("plugins.config.colors").config()
        end,
    })

    -- UI
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.config.indent_blankline").config()
        end,
    })
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.config.nvimtree").config()
        end,
    })
    use("moll/vim-bbye")
    use({
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        after = {
            "vim-bbye",
            "vim-move",
        },
        config = function()
            require("plugins.config.bufferline").config()
        end,
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.config.lualine").config()
        end,
    })

    -- telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            require("plugins.config.telescope").config()
        end,
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter").config()
        end,
    })
    use("nvim-treesitter/playground")
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "vim-unimpaired",
    })
    use("p00f/nvim-ts-rainbow")
    use("windwp/nvim-ts-autotag")
    use({
        "romgrk/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup()
        end,
    })
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use({
        "RRethy/nvim-treesitter-endwise",
        config = function()
            require("nvim-treesitter.configs").setup({ endwise = { enable = true } })
        end,
    })
    use({
        "ThePrimeagen/refactoring.nvim",
        config = function()
            require("refactoring").setup({})
        end,
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.config.lspconfig").config()
        end,
    })
    use("arkav/lualine-lsp-progress")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use({
        "jose-elias-alvarez/null-ls.nvim",
        require = "plenary.nvim",
    })
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({})
        end,
    })
    use({
        "ray-x/lsp_signature.nvim",
        config = function()
            require("plugins.config.lsp_signature").config()
        end,
    })

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- testing
    use({
        "michaelb/sniprun",
        run = "bash ./install.sh",
        config = function()
            require("plugins.config.sniprun").config()
        end,
    })
    use({
        "rcarriga/vim-ultest",
        requires = "vim-test/vim-test",
        after = "vim-unimpaired",
        run = ":UpdateRemotePlugins",
    })

    -- DAP
    use({
        "mfussenegger/nvim-dap",
        config = function()
            require("plugins.config.dap").config()
        end,
    })
    use("nvim-telescope/telescope-dap.nvim")
    use("mfussenegger/nvim-dap-python")

    -- automatically set up your configuration after cloning packer.nvim
    -- put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)

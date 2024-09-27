local solarized_light = require("plugins.config.colors").solarized_light

local M = {}

-- Solarized light theme colors
M.config = function()
    vim.o.background = "light"
    require("solarized").setup({
        colors = function()
            return solarized_light
        end,
        highlights = function(colors)
            return {
                --[[ Vanilla Neovim ]]
                -- window separator
                WinSeparator = { fg = colors.base02_dark, bg = colors.base02_dark },
                -- listchars
                NonText = { fg = colors.base01 },

                --[[ Telescope.nvim ]]
                -- general
                TelescopeBorder = { fg = colors.base02, bg = colors.base02 },
                TelescopeNormal = { fg = colors.base0, bg = colors.base02 },
                TelescopeSelection = { fg = colors.base01, bg = colors.base02 },
                -- prompt
                TelescopePromptTitle = { fg = colors.base02, bg = colors.cyan, reverse = false },
                TelescopePromptCounter = { fg = colors.blue, bg = colors.base02 },
                TelescopePromptPrefix = { fg = colors.blue, bg = colors.base02 },
                -- results
                TelescopeResultsTitle = { fg = colors.base02, bg = colors.base02, reverse = false },
                -- preview
                TelescopePreviewTitle = { fg = colors.base02, bg = colors.magenta, reverse = false },

                --[[ render-markdown.nvim ]]
                RenderMarkdownH1Bg = { bg = colors.green, fg = colors.base02 },
                RenderMarkdownH2Bg = { bg = colors.cyan, fg = colors.base02 },
                RenderMarkdownH3Bg = { bg = colors.blue, fg = colors.base02 },
                RenderMarkdownH4Bg = { bg = colors.violet, fg = colors.base02 },
                RenderMarkdownH5Bg = { bg = colors.magenta, fg = colors.base02 },
                RenderMarkdownH6Bg = { bg = colors.orange, fg = colors.base02 },

                --[[ aerial.nvim ]]
                AerialLine = { bg = colors.base01, fg = colors.base03 },

                --[[ vim-illuminate ]]
                IlluminatedWordText = { bg = colors.base02, underline = true },
                IlluminatedWordRead = { bg = colors.base02, underline = true },
                IlluminatedWordWrite = { bg = colors.base02, underline = true },

                --[[ nvim-hlslens ]]
                HlSearchLensNear = { bg = colors.orange, fg = colors.base02 },
                HlSearchLens = { bg = colors.yellow, fg = colors.base02 },
                HlSearchNear = { bg = colors.orange, fg = colors.base02 },
            }
        end,
    })
    vim.cmd.colorscheme("solarized")
end

return M

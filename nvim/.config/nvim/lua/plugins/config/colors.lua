local M = {}

-- Solarized light theme colors
local solarized_light = {
    base03 = "#fdf6e3",
    base02 = "#eee8d5",
    base01 = "#93a1a1",
    base00 = "#839496",
    base0 = "#657b83",
    base1 = "#586e75",
    base2 = "#073642",
    base3 = "#002b36",
    yellow = "#b58900",
    orange = "#cb4b16",
    red = "#dc322f",
    magenta = "#d33682",
    violet = "#6c71c4",
    blue = "#268bd2",
    cyan = "#2aa198",
    green = "#859900",

    -- Non-standard colors
    base02_dark = "#e3ddcc", -- NvimTree background
}

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
            }
        end,
    })
    vim.cmd.colorscheme("solarized")
end

M.colors = solarized_light

return M

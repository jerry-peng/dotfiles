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
                -- ensure inline code in heading is displayed correctly
                RenderMarkdownCodeInline = { bg = colors.base02_dark, fg = colors.base0 },

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

                --[[ neotest ]]
                NeotestAdapterName = { fg = colors.magenta },
                NeotestDir = { fg = colors.blue },
                NeotestFailed = { fg = colors.red, bg = colors.base02 },
                NeotestFile = { fg = colors.blue },
                NeotestMarked = { fg = colors.orange },
                NeotestNamespace = { fg = colors.violet },
                NeotestPassed = { fg = colors.green, bg = colors.base02 },
                NeotestRunning = { fg = colors.cyan, bg = colors.base02 },
                NeotestWinSelect = { fg = colors.blue },
                NeotestSkipped = { fg = colors.yellow, bg = colors.base02 },
                NeotestTarget = { fg = colors.magenta },
                NeotestWatching = { fg = colors.yellow },
                NeotestNormal = { bg = colors.base02_dark },

                --[[ nvim-dap]]
                DapUIScope = { fg = colors.blue },
                DapUIType = { fg = colors.violet },
                DapUIModifiedValue = { fg = colors.blue },
                DapUIDecoration = { fg = colors.blue },
                DapUIThread = { fg = colors.blue },
                DapUIDStoppedThread = { fg = colors.blue },
                DapUISource = { fg = colors.violet },
                DapUILineNumber = { fg = colors.blue },
                DapUIFloatBorder = { fg = colors.blue },
                DapUIWatchesEmpty = { fg = colors.yellow },
                DapUIWatchesValue = { fg = colors.green },
                DapUIWatchesError = { fg = colors.red },
                DapUIBreakpointsPath = { fg = colors.blue },
                DapUIBreakpointsInfo = { fg = colors.green },
                DapUIBreakpointsCurrentLine = { fg = colors.green },
                DapUIBreakpointsLine = { fg = colors.blue },
                DapUIBreakpointsDisabledLine = { fg = colors.orange },
                DapUIStepOver = { fg = colors.blue },
                DapUIStepInto = { fg = colors.blue },
                DapUIStepBack = { fg = colors.blue },
                DapUIStepOut = { fg = colors.blue },
                DapUIStop = { fg = colors.red },
                DapUIPlayPause = { fg = colors.green },
                DapUIRestart = { fg = colors.green },
                DapUIUnavailable = { fg = colors.orange },
                DapUIWinSelect = { fg = colors.blue },
                DapUIStoppedThread = { fg = colors.blue },
                DapUIPlayPauseNC = { fg = colors.green, bg = colors.base02 },
                DapUIRestartNC = { fg = colors.green, bg = colors.base02 },
                DapUIStopNC = { fg = colors.red, bg = colors.base02 },
                DapUIUnavailableNC = { fg = colors.orange, bg = colors.base02 },
                DapUIStepOverNC = { fg = colors.blue, bg = colors.base02 },
                DapUIStepIntoNC = { fg = colors.blue, bg = colors.base02 },
                DapUIStepBackNC = { fg = colors.blue, bg = colors.base02 },
                DapUIStepOutNC = { fg = colors.blue, bg = colors.base02 },
            }
        end,
    })
    vim.cmd.colorscheme("solarized")
end

return M

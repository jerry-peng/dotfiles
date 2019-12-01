local utils = require("solarized.utils")
local M = {}

-- Solarized Light
local colors = {
    none = { "none", "none" },
    base2 = { "#073642", 23 },
    red = { "#dc322f", 203 },
    green = { "#859900", 142 },
    yellow = { "#b58900", 178 },
    blue = { "#268bd2", 38 },
    magenta = { "#d33682", 169 },
    cyan = { "#2aa198", 37 },
    base02 = { "#eee8d5", 230 },
    base3 = { "#002b36", 23 },
    orange = { "#cb4b16", 166 },
    base1 = { "#586e75", 102 },
    base0 = { "#657b83", 103 },
    base00 = { "#839496", 145 },
    violet = { "#6c71c4", 104 },
    base01 = { "#93a1a1", 145 },
    base03 = { "#fdf6e3", 231 },
    back = { "#fdf6e3", 231 },
    err_bg = { "#fdf6e3", 231 },
}

local syntax = {
    -- Make LineNr without bg color so it looks consistent with git/lsp columns
    LineNr = { fg = colors.base00, bg = utils.termtrans(colors.base03) },

    -- Search customization
    WildMenu = { fg = colors.yellow, bg = colors.base02, style = "reverse" },

    -- GitSigns override
    GitSignsAdd = { fg = colors.green, bg = colors.base03, guisp = colors.green },
    GitSignsChange = { fg = colors.yellow, bg = colors.base03, guisp = colors.yellow },
    GitSignsDelete = { fg = colors.red, bg = colors.base03, style = "bold" },

    -- nvim-cmp
    CmpItemAbbrDeprecated = { fg = colors.base1, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = colors.blue },
    CmpItemAbbrMatchFuzzy = { fg = colors.blue },
    CmpItemKindVariable = { fg = colors.cyan },
    CmpItemKindInterface = { fg = colors.cyan },
    CmpItemKindText = { fg = colors.cyan },
    CmpItemKindFunction = { fg = colors.violet },
    CmpItemKindMethod = { fg = colors.violet },
    CmpItemKindKeyword = { fg = colors.magenta },
    CmpItemKindProperty = { fg = colors.magenta },
    CmpItemKindUnit = { fg = colors.magenta },

    UltestPass = { fg = colors.green },
    UltestFail = { fg = colors.red },
    UltestRunning = { fg = colors.yellow },
    UltestBorder = { fg = colors.orange },
    UltestSummaryInfo = { fg = colors.cyan },
    UltestSummaryFile = { fg = colors.cyan },
    UltestSummaryNamespace = { fg = colors.cyan },
}

local function override_colors()
    for group, highlights in pairs(syntax) do
        utils.highlighter(group, highlights)
    end
end

M.config = function()
    vim.cmd("colorscheme solarized")
    vim.opt.background = "light"
    override_colors()
end

M.colors = colors

return M

local colors = require("plugins.config.colors").colors
local M = {}

M.config = function()
    require("sniprun").setup({
        repl_enable = { "Python3_original", "Lua_original" },
        display = {
            "TerminalWithCode",
        },
        snipruncolors = {
            SniprunVirtualTextOk = { bg = colors.cyan[0], fg = colors.base0[0] },
            SniprunFloatingWinOk = { bg = colors.cyan[0], fg = colors.base0[0] },
            SniprunVirtualTextErr = { bg = colors.orange[0], fg = colors.base0[0] },
            SniprunFloatingWinErr = { bg = colors.orange[0], fg = colors.base0[0] },
        },
    })
end

return M

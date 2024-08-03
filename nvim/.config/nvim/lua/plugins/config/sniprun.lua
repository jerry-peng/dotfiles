local colors = require("plugins.config.colors").colors
local M = {}

M.config = function()
    require("sniprun").setup({
        selected_interpreters = { "Python3_fifo" },
        repl_enable = { "Python3_fifo", "Lua_original" },
        display = {
            "TerminalWithCode",
        },
        snipruncolors = {
            SniprunVirtualTextOk = { bg = colors.cyan, fg = colors.base0 },
            SniprunFloatingWinOk = { bg = colors.cyan, fg = colors.base0 },
            SniprunVirtualTextErr = { bg = colors.orange, fg = colors.base0 },
            SniprunFloatingWinErr = { bg = colors.orange, fg = colors.base0 },
        },
    })
end

return M

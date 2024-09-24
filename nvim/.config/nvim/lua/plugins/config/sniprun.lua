local solarized_light = require("plugins.config.colors").solarized_light
local M = {}

M.config = function()
    require("sniprun").setup({
        selected_interpreters = { "Python3_fifo" },
        repl_enable = { "Python3_fifo", "Lua_original" },
        display = {
            "TerminalWithCode",
        },
        snipruncolors = {
            SniprunVirtualTextOk = { bg = solarized_light.cyan, fg = solarized_light.base0 },
            SniprunFloatingWinOk = { bg = solarized_light.cyan, fg = solarized_light.base0 },
            SniprunVirtualTextErr = { bg = solarized_light.orange, fg = solarized_light.base0 },
            SniprunFloatingWinErr = { bg = solarized_light.orange, fg = solarized_light.base0 },
        },
    })
end

return M

local M = {}

-- Solarized light theme colors
local colors = {
    none = { "none", "none" },
    base03 = { "#fdf6e3", 231 },
    base02 = { "#eee8d5", 230 },
    base01 = { "#93a1a1", 145 },
    base00 = { "#839496", 145 },
    base0 = { "#657b83", 103 },
    base1 = { "#586e75", 102 },
    base2 = { "#073642", 23 },
    base3 = { "#002b36", 23 },
    yellow = { "#b58900", 178 },
    orange = { "#cb4b16", 166 },
    red = { "#dc322f", 203 },
    magenta = { "#d33682", 169 },
    violet = { "#6c71c4", 104 },
    blue = { "#268bd2", 38 },
    cyan = { "#2aa198", 37 },
    green = { "#859900", 142 },
}

M.config = function()
    vim.cmd("colorscheme solarized")
    vim.opt.background = "light"
end

M.colors = colors

return M

local colors = require("plugins.config.colors").colors

local M = {}

M.config = function()
    local highlight = {
        "RainbowOrange",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.red[1]})
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow[1] })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.blue[1] })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.orange[1] })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.green[1] } )
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.violet[1] })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.cyan[1] })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup({
        indent = {
            char = "▏",
            highlight = "IblScope"
        },
        scope = {
            char = "▎",
            highlight = highlight
        }
    })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M

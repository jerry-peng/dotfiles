local colors = require("plugins.config.colors").colors

local M = {}

M.config = function()
    -- Use rainbow-delimiters.nvim highlight group as indent guide color
    local highlight = {
        "RainbowOrange",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.red })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.blue })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.orange })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.green })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.violet })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.cyan })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup({
        indent = {
            char = "▏",
            highlight = "IblScope",
        },
        scope = {
            char = "▎",
            highlight = highlight,
        },
    })

    -- rainbow-delimiters.nvim integration
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M

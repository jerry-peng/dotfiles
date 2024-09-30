local solarized_light = require("plugins.config.colors").solarized_light

local M = {}

M.config = function()
    require("coverage").setup({
        highlights = {
            covered = { fg = solarized_light.cyan, bg = solarized_light.base02 },
            partial = { fg = solarized_light.orange, bg = solarized_light.base02 },
            uncovered = { fg = solarized_light.red, bg = solarized_light.base02 },
        },
    })
end

return M

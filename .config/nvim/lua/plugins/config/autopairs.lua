local npairs = require("nvim-autopairs")

local M = {}

M.config = function()
    npairs.setup({
        fast_wrap = {},
    })
    npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
    npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
end

return M

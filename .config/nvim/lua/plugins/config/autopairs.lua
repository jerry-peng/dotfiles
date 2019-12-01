local M = {}

M.config = function()
    local npairs = require("nvim-autopairs")
    npairs.setup({
        fast_wrap = {},
    })
    npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
    npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
end

return M

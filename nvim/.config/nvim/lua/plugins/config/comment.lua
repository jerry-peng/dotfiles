local M = {}

M.config = function()
    require("Comment").setup({
        -- integration with nvim-ts-object-commentstring to set `commentstring` based on location
        -- in files that contain multiple languages
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
end

return M

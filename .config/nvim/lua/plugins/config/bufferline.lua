local M = {}

M.config = function()
    require("bufferline").setup({
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
            },
            separator_style = "slant",
            show_buffer_close_icons = false,
            show_close_icon = false,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
        },
    })
    local keys = require("core.keys").after.bufferline
    require("core.mappings").register(keys)
end

return M

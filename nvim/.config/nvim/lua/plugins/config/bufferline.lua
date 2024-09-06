local M = {}

M.config = function()
    require("bufferline").setup({
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
            show_buffer_close_icons = false,
            show_close_icon = false,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, _diagnostics_dict, _context)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
        },
    })
end

return M

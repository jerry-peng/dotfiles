local M = {}

M.config = function()
    require("lualine").setup({
        theme = "solarized_light",
        sections = {
            lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
            lualine_c = {
                "filename",
                "lsp_progress",
            },
        },
    })
end

return M

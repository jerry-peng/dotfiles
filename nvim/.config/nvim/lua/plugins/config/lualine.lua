local M = {}

M.config = function()
    require("lualine").setup({
        options = {
            disabled_filetypes = {
                statusline = { "NvimTree" },
                winbar = {},
            },
        },
        theme = "solarized_light",
        sections = {
            lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
            lualine_c = {
                "filename",
                "lsp_progress",
            },
        },
        -- winbar = {
        --     lualine_c = {
        --         {
        --             "navic",
        --             color_correction = nil,
        --             navic_opts = nil,
        --         },
        --     },
        -- },
    })
end

return M

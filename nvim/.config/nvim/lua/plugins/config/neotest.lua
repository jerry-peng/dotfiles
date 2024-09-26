local M = {}

M.config = function()
    require("neotest").setup({
        adapters = {
            require("neotest-python")({
                dap = { justMyCode = false },
            }),
            require("neotest-jest")({
                jestCommand = "npm test --",
                jestConfigFile = "custom.jest.config.ts",
                env = { CI = true },
                cwd = function(_)
                    return vim.fn.getcwd()
                end,
            }),
            require("rustaceanvim.neotest"),
            require("neotest-vim-test")({
                ignore_file_types = {
                    "python",
                    "vim",
                    "lua",
                },
            }),
        },
    })
end

return M

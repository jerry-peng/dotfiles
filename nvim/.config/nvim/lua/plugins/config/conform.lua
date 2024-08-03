local M = {}

M.config = function()
    require("conform").setup({
        formatters_by_ft = {
            c = { "clang_format" },
            cpp = { "clang_format" },
            python = { "isort", "black", "ruff_format" },
            rust = { "rustfmt" },
            javascript = { "eslint_d", "prettierd" },
            javascriptreact = { "eslint_d", "prettierd" },
            typescript = { "eslint_d", "prettierd" },
            typescriptreact = { "eslint_d", "prettierd" },
            vue = { "eslint_d", "prettierd" },
            lua = { "stylua" },
            ruby = { "rubocop" },
            kotlin = { "ktlint" },
            haskell = { "fourmolu" },
            shell = { "shellcheck", "shfmt" },
            sql = { "sqlfluff", "sql_formatter" },
            dockerfile = {},
            html = { "prettierd" },
            css = { "stylelint", "prettierd" },
            yaml = { "yamlfmt" },
            json = { "prettierd" },
            markdown = { "markdownlint", "prettierd" },
        },
        format_on_save = {
            timeout_ms = 5000,
            lsp_fallback = true,
        },
    })
end

return M

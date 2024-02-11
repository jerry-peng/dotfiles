local M = {}

M.config = function()
    require("lint").linters_by_ft = {
        c = { "cpplint" },
        cpp = { "cpplint" },
        python = { "ruff" },
        rust = {},
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d" },
        lua = { "luacheck" },
        ruby = { "rubocop" },
        kotlin = { "ktlint" },
        haskell = {},
        shell = { "shellcheck" },
        sql = { "sqlfluff" },
        dockerfile = { "hadolint" },
        html = {},
        css = { "stylelint" },
        yaml = { "yamllint" },
        json = { "jsonlint" },
        markdown = { "markdownlint" },
    }
    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
        callback = function()
            require("lint").try_lint()
        end,
    })
end

return M

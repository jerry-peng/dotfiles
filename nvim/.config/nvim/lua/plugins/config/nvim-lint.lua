local M = {}

M.config = function()
    local linters_by_ft = {
        c = { "cpplint" },
        cpp = { "cpplint" },
        -- python = { "ruff" }, -- diagnostics configured in lspconfig, linting configured in conform
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
    for _, linters in pairs(linters_by_ft) do
        table.insert(linters, "typos")
    end
    require("lint").linters_by_ft = linters_by_ft
    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
        callback = function()
            require("lint").try_lint()
        end,
    })
end

return M

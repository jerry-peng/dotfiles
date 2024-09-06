local utils = require("core.utils")

local M = {}

M.servers = {
    "clangd", -- C/C++
    "pyright", -- Python
    "ruff", -- Python
    "rust_analyzer", -- Rust
    "tsserver", -- JS/TS
    "lua_ls", -- Lua
    "solargraph", -- Ruby
    "kotlin_language_server", -- Kotlin
    "hls", -- Haskell
    "bashls", -- Shell
    "sqls", -- SQL
    "dockerls", -- Docker
    "html", -- HTML
    "cssls", -- CSS
    "yamlls", -- YAML
    "jsonls", -- JSON
    "marksman", -- Markdown
}

-- Some linters includes formatting capabilities
M.linters = {
    "cpplint", -- C/C++
    "ruff", -- Python
    "eslint_d", -- JavaScript/TypeScript/JSX/TSX/Vue/etc
    "luacheck", -- Lua
    "rubocop", -- Ruby; linter + formatter
    "ktlint", -- Kotlin; linter + formatter
    "shellcheck", -- Shell
    "sqlfluff", -- SQL
    "hadolint", -- Docker
    "stylelint", -- CSS
    "yamllint", -- YAML
    "jsonlint", -- JSON
    "markdownlint", -- Markdown
    "typos", -- Spellchecker
}

M.formatters = {
    -- rustfmt (Rust formatter) installed through rustup
    "clang-format", -- C/C++/Java/JavaScript/JSON/Objective-C/Protobuf/C#
    "stylua", -- Lua
    "prettierd", -- HTML/CSS/JavaScript/TypeScript/JSX/TSX/Vue/JSON/YAML/Markdown/etc
    "fourmolu", -- Haskell
    "shfmt", -- Shell
    "sql-formatter", -- SQL
    "yamlfmt", -- YAML
}

M.debug_adapters = {
    "debugpy", -- Python
    "codelldb", -- C/C++/Rust
    "js-debug-adapter", -- JavaScript/TypeScript
}

M.tools = utils.flatten_lists({ M.servers, M.linters, M.formatters, M.debug_adapters })

M.config = function()
    require("mason-tool-installer").setup({
        ensure_installed = M.tools,
        auto_update = true,
        run_on_start = true,
        start_delay = 3000,
        debounce_hours = 20, -- at least 20 hours between attempts to install/update
    })
end

return M

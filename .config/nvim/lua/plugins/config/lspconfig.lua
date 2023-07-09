local cmp = require("cmp")
local luasnip = require("luasnip")
local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")
local keys = require("core.keys")

local M = {}

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local servers = {
    "ccls",
    "dockerls",
    "gopls",
    "hls",
    "kotlin_language_server",
    "pyright",
    "rust_analyzer",
    "lua_ls",
    "tsserver",
}

local lsp_opt_setup = {
    default = function()
        return {}
    end,
    lua_ls = function()
        local runtime_path = vim.split(package.path, ";")
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")

        return {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = runtime_path,
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
    end,
}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

M.config = function()
    -- load snippets
    luasnip.config.setup({
        region_check_events = 'InsertEnter'
    })
    require("luasnip.loaders.from_vscode").load()

    -- function executed when servers are attached
    local on_attach = function(_, _) end

    -- setup each language server
    for _, lsp in ipairs(servers) do
        local setup_func = lsp_opt_setup[lsp]
        if setup_func == nil then
            setup_func = lsp_opt_setup.default
        end

        local opts = setup_func()
        if opts.capabilities == nil then
            local capabilities = require("cmp_nvim_lsp").default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

            opts.capabilities = capabilities
        end

        opts.on_attach = on_attach
        opts.flags = { debounce_text_changes = 150 }
        nvim_lsp[lsp].setup(opts)
    end

    -- setup null-ls for formatting/diagnostics/code actions
    require("null-ls").setup({
        sources = {
            null_ls.builtins.diagnostics.cppcheck,
            null_ls.builtins.diagnostics.shellcheck,
            null_ls.builtins.diagnostics.yamllint,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.clang_format,
            null_ls.builtins.formatting.cmake_format,
            null_ls.builtins.formatting.codespell,
            null_ls.builtins.formatting.eslint_d,
            null_ls.builtins.formatting.fixjson,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.prettier.with({
                extra_filetypes = { "toml" },
            }),
            null_ls.builtins.formatting.rustfmt,
            null_ls.builtins.formatting.shfmt,
            null_ls.builtins.formatting.shellharden,
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.code_actions.eslint_d,
        },
    })

    -- auto-completion
    cmp.setup({
        enabled = function()
            local context = require("cmp.config.context")
            return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end,
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[Latex]",
                })[entry.source.name]
                return vim_item
            end,
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = {
            [keys.cmp.scroll_docs_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
            [keys.cmp.scroll_docs_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
            [keys.cmp.open_complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            -- remove default `<C-y>` mapping.
            [keys.cmp.disable_default] = cmp.config.disable,
            [keys.cmp.abort] = cmp.mapping(cmp.mapping.abort(), { "i", "s", "c" }),
            -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items
            [keys.cmp.prev_item] = cmp.mapping.select_prev_item(),
            [keys.cmp.next_item] = cmp.mapping.select_next_item(),
            [keys.cmp.tab] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    local entry = cmp.get_selected_entry()
                    if not entry then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        cmp.confirm()
                    else
                        cmp.confirm()
                    end
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
            [keys.cmp.shift_tab] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.close()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
        },
        sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } }, { { name = "buffer" } }),
    })

    -- auto-completion for search
    cmp.setup.cmdline("/", {
        sources = { { name = "buffer" } },
    })

    -- auto-completion for command line
    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })

    -- insert function brackets when auto-completing functions
    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } }))
end

return M

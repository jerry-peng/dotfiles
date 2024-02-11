local cmp = require("cmp")
local luasnip = require("luasnip")
local nvim_lsp = require("lspconfig")
local keys = require("core.keymaps").plugins

local lsp_opt_setup = {
    default = function()
        return {}
    end,
}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local M = {}

M.config = function()
    -- Initialize
    require("mason-lspconfig").setup({
        ensure_installed = require("plugins.config.mason-tools").servers,
        automatic_installation = false, -- servers are installed through mason-tools-installer
        -- LSP setup handlers
        handlers = {
            function(server_name) -- default handler
                require("lspconfig")[server_name].setup({})
            end,
            ["lua_ls"] = function()
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
        },
    })

    -- load snippets
    luasnip.config.setup({
        region_check_events = "InsertEnter",
    })
    require("luasnip.loaders.from_vscode").load()

    -- auto-completion
    cmp.setup({
        enabled = function()
            local context = require("cmp.config.context")
            return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end,
        sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } }, { { name = "buffer" } }),
        formatting = {
            -- Add symbol type, kind icon, source type to completion menu
            format = require("lspkind").cmp_format({
                mode = "text_symbol", -- show only symbol annotations
                maxwidth = function()
                    return math.floor(0.45 * vim.o.columns)
                end,
                ellipsis_char = "...", -- shown when popup menu exceed maxwidth
                show_labelDetails = false, -- show labelDetails in menu. Disabled by default
                before = function(entry, vim_item)
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]",
                    })[entry.source.name]
                    return vim_item
                end,
            }),
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
    })

    -- auto-completion for search
    cmp.setup.cmdline("/", {
        sources = { { name = "buffer" } },
    })

    -- auto-completion for command line
    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })

    -- insert function parenthesis when auto-completing functions
    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end

return M

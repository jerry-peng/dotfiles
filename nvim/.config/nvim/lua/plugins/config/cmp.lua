local cmp = require("cmp")
local luasnip = require("luasnip")
local plugin_keys = require("core.key-passthru")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local M = {}

M.config = function()
    -- global flag to toggle cmp
    vim.g.cmp_enabled = true

    luasnip.config.setup({
        -- event on which to leave snippet root if cursor is outside of its region
        -- this
        region_check_events = "InsertEnter",
    })
    -- load snippets templates
    require("luasnip.loaders.from_vscode").lazy_load()

    -- auto-completion
    cmp.setup({
        enabled = function()
            -- disable completion in prompt, e.g. telescope prompt
            if vim.bo.buftype == "prompt" then
                return false
            end
            -- disable completion in comments unless in command mode
            local context = require("cmp.config.context")
            if vim.api.nvim_get_mode().mode == "c" then
                return true
            elseif context.in_treesitter_capture("comment") or context.in_syntax_group("Comment") then
                return false
            end

            return vim.g.cmp_enabled
        end,
        -- disable preselecting entry
        preselect = cmp.PreselectMode.None,
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "nvim_lsp_signature_help" },
        }, {
            { name = "buffer" },
        }),
        mapping = {
            [plugin_keys.cmp.scroll_docs_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
            [plugin_keys.cmp.scroll_docs_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
            [plugin_keys.cmp.prev_item] = cmp.mapping(function()
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            end, { "i", "c" }),
            [plugin_keys.cmp.next_item] = cmp.mapping(function()
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            end, { "i", "c" }),
            [plugin_keys.cmp.toggle] = cmp.mapping(function()
                -- if cmp is enabled, disable cmp and close window
                -- otherwise enable cmp and open completion window
                if vim.g.cmp_enabled then
                    vim.g.cmp_enabled = false
                    cmp.close()
                else
                    vim.g.cmp_enabled = true
                    cmp.complete()
                end
            end, { "i", "c" }),
            -- abort restores completion insert changes
            [plugin_keys.cmp.abort] = cmp.mapping(cmp.mapping.abort(), { "i", "s", "c" }),
            [plugin_keys.cmp.tab] = cmp.mapping(function(fallback)
                -- if completion window is visible, tab selects first entry
                -- otherwise select selected entry
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
                    -- if there are words before cursor, open completion window
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
            [plugin_keys.cmp.shift_tab] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    -- if completion window is visible, close it, useful in snippet
                    cmp.close()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
        },
        formatting = {
            -- add symbol type, kind icon, source type to completion menu items
            format = require("lspkind").cmp_format({
                mode = "text_symbol",
                maxwidth = function()
                    return math.floor(0.45 * vim.o.columns)
                end,
                ellipsis_char = "...", -- shown when popup menu exceed maxwidth
                show_labelDetails = true, -- show labelDetails in menu. Disabled by default
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
                -- specify snippet engine
                luasnip.lsp_expand(args.body)
            end,
        },
    })

    -- auto-completion for search
    cmp.setup.cmdline({ "/", "?" }, {
        sources = { { name = "buffer" } },
    })

    -- auto-completion for command line
    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
        matching = { disallow_symbol_nonprefix_matching = false },
    })

    -- insert function parenthesis when auto-completing functions
    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end

return M

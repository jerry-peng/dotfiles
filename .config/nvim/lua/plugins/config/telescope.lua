local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local previewers = require("telescope.previewers")
local trouble = require("trouble.providers.telescope")
local Job = require("plenary.job")
local keys = require("core.keys")

local M = {}

M.config = function()
    local new_maker = function(filepath, bufnr, opts)
        opts = opts or {}
        filepath = vim.fn.expand(filepath)
        vim.loop.fs_stat(filepath, function(_, stat)
            if not stat then
                return
            end
            if stat.size > 100000 then
                return
            end
        end)
        Job
            :new({
                command = "file",
                args = { "--mime-type", "-b", filepath },
                on_exit = function(j)
                    local mime_type = vim.split(j:result()[1], "/")[1]
                    if mime_type == "text" then
                        previewers.buffer_previewer_maker(filepath, bufnr, opts)
                    else
                        -- maybe we want to write something to the buffer here
                        vim.schedule(function()
                            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                        end)
                    end
                end,
            })
            :sync()
    end

    telescope.setup({
        defaults = {
            mappings = {
                n = {
                    [keys.telescope.toggle_preview] = action_layout.toggle_preview,
                    [keys.telescope.close] = actions.close,
                    [keys.telescope.open_with_trouble] = trouble.open_with_trouble,
                },
                i = {
                    [keys.telescope.toggle_preview] = action_layout.toggle_preview,
                    [keys.telescope.open_with_trouble] = trouble.open_with_trouble,
                },
            },
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--trim",
            },
            scroll_strategy = "limit",
            buffer_previewer_maker = new_maker,
        },
        extensions = {
            fzf_native = {
                fuzzy = true,
                override_generic_sorter = false,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("refactoring")
    telescope.load_extension("dap")
end

return M

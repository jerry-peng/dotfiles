local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local previewers = require("telescope.previewers")
local trouble = require("trouble.providers.telescope")
local Job = require("plenary.job")
local keys = require("core.keymaps").plugins.telescope

local M = {}

--[[
- general
    - quit insert mode
    - clear prompt
    - delete buffer
    - Toggle file preview
    - mapping to cycle previewer for git commits to show full message
- picker
    - file and text search in hidden files and dir
    - remove ./ from `fd` results
    - rg remove indentation
]]

M.config = function()
    local previewer_maker = function(filepath, bufnr, opts)
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
                    [keys.toggle_preview] = action_layout.toggle_preview,
                    [keys.close] = actions.close,
                    [keys.open_with_trouble] = trouble.open_with_trouble,
                    ["cd"] = function(prompt_bufnr)
                        local selection = require("telescope.actions.state").get_selected_entry()
                        local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                        require("telescope.actions").close(prompt_bufnr)
                        -- Depending on what you want put `cd`, `lcd`, `tcd`
                        vim.cmd(string.format("silent lcd %s", dir))
                    end
                },
                i = {
                    ["<c-d>"] = actions.delete_buffer,
                    ["<C-s>"] = actions.cycle_previewers_next,
                    [keys.toggle_preview] = action_layout.toggle_preview,
                    [keys.open_with_trouble] = trouble.open_with_trouble,
                },
            },
            scroll_strategy = "limit",
            buffer_previewer_maker = previewer_maker,
        },
        extensions = {
            fzf_native = {
                fuzzy = true,
                override_generic_sorter = true,
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

local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local trouble = require("trouble.sources.telescope")
local keys = require("core.keymaps").passthrough.telescope

--[[
Note:
- project.nvim automatically set working directory to git root if current working directory
  is in a git directory.
- Use fzf instead of fzy because fzf supports regex.
]]

local M = {}

M.config = function()
    telescope.setup({
        defaults = {
            prompt_prefix = "  ",
            selection_caret = "❯ ",
            sorting_strategy = "ascending", -- display results top to bottom
            layout_strategy = "flex",
            layout_config = {
                flex = {
                    flip_columns = 130,
                },
                vertical = {
                    mirror = true,
                    prompt_position = "top",
                },
                horizontal = {
                    prompt_position = "top",
                },
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file, -- fzf for file sorter
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter, -- fzf sorter for generic sorter
            file_ignore_patterns = { "node_modules" }, -- ignore file pattern
            path_display = { "truncate" }, -- truncate start of path if whole path does not fit in entry row
            vimgrep_arguments = { -- defines command used for `live_grep` and `grep_string`
                "rg",
                "-L",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--trim", -- trims whitespace
                "--hidden", -- search hidden files, respect dot ignore files.
                "--glob", -- exclude files matching `.git` glob below
                "!**/.git/*",
            },
            mappings = {
                n = {
                    [keys.toggle_preview] = action_layout.toggle_preview,
                    [keys.close] = actions.close,
                    [keys.open_trouble] = trouble.open,
                },
                i = {
                    ["<c-d>"] = actions.delete_buffer,
                    ["<C-s>"] = actions.cycle_previewers_next,
                    [keys.toggle_preview] = action_layout.toggle_preview,
                    [keys.open_trouble] = trouble.open,
                },
            },
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        },
        pickers = {
            find_files = {
                -- glob except '.git/'
                find_command = { "rg", "--files", "--glob", "!**/.git/*" },
            },
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

    -- Extensions
    telescope.load_extension("fzf")
    telescope.load_extension("dap")
    telescope.load_extension("projects")
end

return M

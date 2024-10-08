local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local trouble = require("trouble.sources.telescope")
local plugin_keys = require("core.key-passthru").telescope

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
                    [plugin_keys.toggle_preview] = action_layout.toggle_preview,
                    [plugin_keys.close] = actions.close,
                    [plugin_keys.open_trouble] = trouble.open,
                },
                i = {
                    [plugin_keys.cycle_previews_next] = actions.cycle_previewers_next,
                    [plugin_keys.toggle_preview] = action_layout.toggle_preview,
                    [plugin_keys.open_trouble] = trouble.open,
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
            aerial = {
                -- How to format the symbols
                format_symbol = function(symbol_path, filetype)
                    if filetype == "json" or filetype == "yaml" then
                        return table.concat(symbol_path, ".")
                    else
                        return symbol_path[#symbol_path]
                    end
                end,
                -- Available modes: symbols, lines, both
                show_columns = "both",
            },
        },
    })

    -- Extensions
    telescope.load_extension("fzf")
    telescope.load_extension("projects")
    telescope.load_extension("grapple")
    telescope.load_extension("aerial")
end

return M

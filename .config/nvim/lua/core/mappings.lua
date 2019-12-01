local map_funcs = {}

-- m-mode represents default `map`
local modes = { "m", "n", "i", "v", "x", "c", "t", "o" }

local function set_keymap(mode, shortcut, command, options)
    if mode == "m" then
        mode = ""
    end
    if options == nil then
        options = {}
    end
    if options.noremap == nil then
        options.noremap = true
    end
    if options.silent == nil then
        options.silent = true
    end
    if options.expr == nil then
        options.expr = false
    end
    vim.api.nvim_set_keymap(
        mode,
        shortcut,
        command,
        { noremap = options.noremap, silent = options.silent, expr = options.expr }
    )
end

local function map_keymode(mode)
    if modes == "m" then
        return ""
    end
    return mode
end

local M = {
    -- create keymaps
    register = function(keys)
        for _, mode in ipairs(modes) do
            if keys[mode] ~= nil then
                for key, mapping in pairs(keys[mode]) do
                    if #mapping == 1 then
                        set_keymap(map_keymode(mode), key, mapping[1])
                    else
                        set_keymap(map_keymode(mode), key, mapping[1], mapping[2])
                    end
                end
            end
        end
    end,

    register_default = function(self)
        local keys = require("core.keys").default
        self.register(keys)
    end,
}

return M

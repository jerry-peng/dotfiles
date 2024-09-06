--[[
-- Neovim top level configuration
--]]

require("core.options")
require("plugin-manager.lazy")
require("core.keymaps"):register()
require("core.autocmds")

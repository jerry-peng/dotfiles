--[[
-- Neovim top level configuration
--]]

require("core.bootstrap")
require("core.setup")

-- load plugins using lazy.nvim
require("lazy").setup(
    "plugins",
    {
        -- Disable change detection notification
        change_detection = {
            notify = false,
        }
    }
)

require("core.options")
require("core.keymaps"):register()
require("core.autocmds")

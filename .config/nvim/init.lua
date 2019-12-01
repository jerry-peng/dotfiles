-- Configs
vim.lsp.set_log_level("debug")
require("core.setup")
require("plugins")
require("core.options")
require("core.mappings"):register_default()
require("core.autocmds")

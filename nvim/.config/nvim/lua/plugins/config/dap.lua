local widgets = require("dap.ui.widgets")
local M = {}

M.scopes = function()
    widgets.centered_float(widgets.scopes)
end

M.frames = function()
    widgets.centered_float(widgets.frames)
end

M.expressions = function()
    widgets.hover()
end

M.config = function()
    require("dap-python").setup("/usr/local/bin/python3")
    require("dap-python").test_runner = "pytest"
end

return M

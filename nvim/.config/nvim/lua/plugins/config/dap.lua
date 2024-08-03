local dap = require("dap")
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
    require("mason-nvim-dap").setup({
        ensure_installed = {
            -- mason-nvim-dap does not support automatic setup for js-debug-adapter,
            -- setup thru vanilla nvim-dap instead
            "python", -- debugpy
            "codelldb",
        },
        automatic_installation = false,
        handlers = {
            -- Default setup handler
            function(config)
                require("mason-nvim-dap").default_setup(config)
            end,
        },
    })

    local jsDebugServerPath = vim.fn.stdpath("data")
        .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"
    dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
            command = "node",
            args = { jsDebugServerPath, "${port}" },
        },
    }

    local js_dap_configuration = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            runtimeExecutable = "deno",
            runtimeArgs = {
                "run",
                "--inspect-wait",
                "--allow-all",
            },
            program = "${file}",
            cwd = "${workspaceFolder}",
            attachSimplePort = 9229,
        },
    }
    dap.configurations.javascript = js_dap_configuration
    dap.configurations.typescript = js_dap_configuration
end

return M

local M = {}

M.config = function()
    vim.g.rustaceanvim = {
        server = {
            default_settings = {
                ["rust-analyzer"] = {
                    completion = {
                        callable = {
                            -- disable parenthesis completion for functions as it's handled by nvim-autopair
                            snippets = "none",
                        },
                    },
                },
            },
        },
    }
end

return M

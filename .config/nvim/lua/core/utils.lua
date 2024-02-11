local M = {}

M.close_float_windows = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then
            vim.api.nvim_win_close(win, false)
        end
    end
end

-- Parameter type: [[object]]
-- Return type: [object]
M.flatten_lists = function(lists)
    local aggregate = {}
    for _, list in ipairs(lists) do
        for _, item in ipairs(list) do
            table.insert(aggregate, item)
        end
    end
    return aggregate
end

return M

local M = {}

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

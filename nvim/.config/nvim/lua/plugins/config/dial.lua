local M = {}

-- word augend attribute, if true, matches word boundary. E.g. if true, "and/or" augend can increment `for` to `fand`.
-- cyclic augend attribute, if true, cycles elements.
-- only_valid augend attribute for date, does not match invalid date, e.g. 05/32/2022

M.config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
        default = {
            augend.integer.alias.decimal_int,
            augend.integer.alias.hex,
            augend.integer.alias.octal,
            augend.integer.alias.binary,
            augend.date.alias["%m/%d/%y"],
            augend.date.alias["%m/%d/%Y"],
            augend.date.new({
                pattern = "%m-%d-%y",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({
                pattern = "%m-%d-%Y",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({
                pattern = "%m.%d.%y",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({
                pattern = "%m.%d.%Y",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.alias["%m/%d"],
            augend.date.alias["%-m/%-d"],
            augend.date.new({
                pattern = "%m-%d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({
                pattern = "%-m-%-d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({
                pattern = "%m.%d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({
                pattern = "%-m.%-d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.alias["%H:%M:%S"],
            augend.date.alias["%H:%M"],
            augend.hexcolor.new({
                case = "lower",
            }),
            augend.hexcolor.new({
                case = "upper",
            }),
            augend.constant.new({
                elements = { "and", "or" },
                word = true,
                cyclic = true, -- "or" -> "and" -> "or"
            }),
            augend.constant.new({
                elements = { "&&", "||" },
                word = false,
                cyclic = true, -- "&&" -> "||" -> "&&"
            }),
        },
    })
end

return M

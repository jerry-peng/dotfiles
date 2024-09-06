local M = {}

-- word augend attribute, if true, matches word boundary. E.g. if true, "and/or" augend can increment `for` to `fand`.
-- cyclic augend attribute, if true, cycles elements.
-- only_valid augend attribute for date, does not match invalid date, e.g. 05/32/2022

M.config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
        default = {
            augend.integer.alias.decimal_int, -- -8, 0, 12
            augend.integer.alias.hex, -- 0x00, 0x3f3f
            augend.integer.alias.octal, -- 0o00, 0o12
            augend.integer.alias.binary, -- 0b01, 0b1101
            augend.date.alias["%m/%d/%y"], -- 01/31/99
            augend.date.alias["%m/%d/%Y"], -- 01/31/1999
            augend.date.alias["%Y/%m/%d"], -- 1999/01/31
            augend.date.new({ -- 01-31-99
                pattern = "%m-%d-%y",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({ -- 01-31-1999
                pattern = "%m-%d-%Y",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({ -- 1999-01-31
                pattern = "%Y-%m-%d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({ -- 01.31.99
                pattern = "%m.%d.%y",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({ -- 01.31.1999
                pattern = "%m.%d.%Y",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({ -- 1999.01.31
                pattern = "%Y.%m.%d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.alias["%m/%d"], -- 01/06
            augend.date.alias["%-m/%-d"], -- 1/6
            augend.date.new({ -- 01-06
                pattern = "%m-%d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({ -- 1-6
                pattern = "%-m-%-d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({ -- 01.06
                pattern = "%m.%d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.new({ -- 1.6
                pattern = "%-m.%-d",
                default_kind = "day",
                only_valid = true,
                word = false,
            }),
            augend.date.alias["%H:%M:%S"], -- 15:24:30
            augend.date.alias["%H:%M"], -- 15:24
            augend.hexcolor.new({
                case = "lower",
            }),
            augend.hexcolor.new({
                case = "upper", -- 0xEEFE
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

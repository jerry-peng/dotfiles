local solarized_light = require("plugins.config.colors").solarized_light

local M = {}

M.config = function()
    require("barbecue").setup({
        -- note: overriding background for all barbecue highlights
        theme = {
            -- this highlight is used to override other highlights
            normal = { bg = solarized_light.base02_dark },

            -- these highlights correspond to symbols table from config
            ellipsis = { bg = solarized_light.base02_dark },
            separator = { bg = solarized_light.base02_dark },
            modified = { bg = solarized_light.base02_dark },

            -- these highlights represent the _text_ of three main parts of barbecue
            dirname = { bg = solarized_light.base02_dark },
            basename = { bg = solarized_light.base02_dark },
            context = { bg = solarized_light.base02_dark },

            -- these highlights are used for context/navic icons
            context_file = { bg = solarized_light.base02_dark },
            context_module = { bg = solarized_light.base02_dark },
            context_namespace = { bg = solarized_light.base02_dark },
            context_package = { bg = solarized_light.base02_dark },
            context_class = { bg = solarized_light.base02_dark },
            context_method = { bg = solarized_light.base02_dark },
            context_property = { bg = solarized_light.base02_dark },
            context_field = { bg = solarized_light.base02_dark },
            context_constructor = { bg = solarized_light.base02_dark },
            context_enum = { bg = solarized_light.base02_dark },
            context_interface = { bg = solarized_light.base02_dark },
            context_function = { bg = solarized_light.base02_dark },
            context_variable = { bg = solarized_light.base02_dark },
            context_constant = { bg = solarized_light.base02_dark },
            context_string = { bg = solarized_light.base02_dark },
            context_number = { bg = solarized_light.base02_dark },
            context_boolean = { bg = solarized_light.base02_dark },
            context_array = { bg = solarized_light.base02_dark },
            context_object = { bg = solarized_light.base02_dark },
            context_key = { bg = solarized_light.base02_dark },
            context_null = { bg = solarized_light.base02_dark },
            context_enum_member = { bg = solarized_light.base02_dark },
            context_struct = { bg = solarized_light.base02_dark },
            context_event = { bg = solarized_light.base02_dark },
            context_operator = { bg = solarized_light.base02_dark },
            context_type_parameter = { bg = solarized_light.base02_dark },
        },
    })
end

return M

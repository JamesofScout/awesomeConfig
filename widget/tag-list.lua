local wibox = require("wibox")

local function build(scr, offset)
    return wibox.widget {
        image  = beautiful.awesome_icon,
        resize = false,
        widget = wibox.widget.imagebox
    }
end

return build
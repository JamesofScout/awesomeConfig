local wibox = require("wibox")
local beautiful = require("beautiful")

local function build(scr, offset)
    local tags = scr.tags
    for _,tag in tags do 
        wibox.widget {
            image  = tag.icon,
            resize = false,
            widget = wibox.widget.imagebox
        }
    end
    
end

return wibox.widget {
    image  = "test.png",
    resize = false,
    forced_height = nil,
    forced_width = nil,
    widget = wibox.widget.imagebox
}
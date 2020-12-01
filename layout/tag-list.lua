local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local taglist = nil



local function TagList(scr, offset)
    taglist = awful.widget.taglist {
        screen = scr,
        filter = awful.widget.taglist.filter.all,
        buttons = gears.table.join(
            awful.button({ }, 1,function(t) t:view_only() end)
        )
    }
    if offset then 
        offsetY = dpi(12) 
        offsetX = dpi(10)
    end
    local panel = wibox {
        ontop = false,
        screen = scr,
        visible = true,
        height = dpi(32),
        width = dpi(48),
        x = scr.geometry.x + offsetX,
        y = scr.geometry.y + offsetY,
        stretch = false,
        bg = theme.colors.background,
        struts = {top = dpi(32)}
    }

    panel:setup{layout = wibox.layout.fixed.horizontal, taglist}

    return panel
end

return TagList
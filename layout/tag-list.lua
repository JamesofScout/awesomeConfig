local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi
local taglist = require("widget.tag-list")

local function ClockPanel(scr, offset)
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
        fg = theme.colors.foreground,
        struts = {top = dpi(32)}
    }

    panel:setup{layout = wibox.layout.align.horizontal, taglist}

    return panel
end

return ClockPanel
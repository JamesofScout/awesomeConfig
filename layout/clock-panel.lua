local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi

-- Clock / Calendar 24h format
local textclock = wibox.widget.textclock('<span>%H:%M</span>')

local clock_widget = wibox.container.margin(textclock, dpi(8), dpi(8), dpi(8),dpi(8))

local function ClockPanel(scr, offset) 
    local offsetX = 0
    if offset then offsetY = dpi(12) end
    local panel = wibox {
        ontop = false,
        screen = scr,
        visible = true,
        height = dpi(32),
        width = dpi(48),
        x = scr.geometry.width - dpi(184),
        y = scr.geometry.y + offsetY,
        stretch = false,
        bg = theme.colors.accent,
        fg = theme.colors.foreground
        struts = {top = dpi(32)}
    }

    panel:setup{layout = wibox.layout.fixed.horizontal, clock_widget}

    return panel
end

return ClockPanel
local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi
--theme = require("theme")

-- Clock / Calendar 24h format
local textclock = wibox.widget.textclock('<span font="Font-Awesome bold 10">%H:%M</span>')

local clock_widget = wibox.container.margin(textclock, dpi(8), dpi(8), dpi(8),dpi(8))

local function ClockPanel(scr, offset)
    local offsetX = 0
    local offsetY = 0
    if offset then offsetY = dpi(12, scr) end
    local panel = wibox {
        ontop = false,
        screen = scr,
        visible = true,
        height = dpi(32),
        width = dpi(60),
        x = scr.geometry.x + scr.geometry.width - dpi(100, scr),
        y = scr.geometry.y + offsetY,
        stretch = false,
        bg = theme.colors.accent,
        fg = theme.colors.foreground,
    }

    panel:setup{layout = wibox.layout.fixed.horizontal, clock_widget}

    return panel
end

return ClockPanel
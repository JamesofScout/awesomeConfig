local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi

-- Clock / Calendar 24h format
local textclock = wibox.widget.textclock('<span>%H:%M</span>')

local clock_widget = wibox.container.margin(textclock, dpi(8), dpi(8), dpi(8),dpi(8))
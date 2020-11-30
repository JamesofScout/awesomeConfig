local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local TaskList = require('widget.task-list')
local TagList = require('widget.tag-list')
local gears = require('gears')
local clickable_container = require('widget.material.clickable-container')
local mat_icon_button = require('widget.material.icon-button')
local mat_icon = require('widget.material.icon')

local dpi = require('beautiful').xresources.apply_dpi

local icons = require('theme.icons')

local textclock = wibox.widget.textclock('%H:%M')

-- Add a calendar (credits to kylekewley for the original code)
local month_calendar = awful.widget.calendar_popup.month(
                           {
        screen = s,
        start_sunday = false,
        week_numbers = true
    })
month_calendar:attach(textclock)

local clock_widget = wibox.container.margin(textclock, dpi(13), dpi(13), dpi(8), dpi(8))


function Create_Taskbar(Screen) {
    
}
local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi

local tasklist = awful.widget.tasklist {
    screen   = s,
    filter   = awful.widget.tasklist.filter.currenttags,
    buttons  = tasklist_buttons,
    layout   = {
        spacing_widget = {
            {
                forced_width  = 5,
                forced_height = 24,
                thickness     = 1,
                color         = '#777777',
                widget        = wibox.widget.separator
            },
            valign = 'center',
            halign = 'center',
            widget = wibox.container.place,
        },
        spacing = 1,
        layout  = wibox.layout.fixed.horizontal
    },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
    widget_template = {
        {
            wibox.widget.base.make_widget(),
            forced_height = 5,
            id            = 'background_role',
            widget        = wibox.container.background,
        },
        {
            awful.widget.clienticon,
            margins = 5,
            widget  = wibox.container.margin
        },
        layout = wibox.layout.align.vertical,
    },
}

local function TaskList(scr, offset)
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
        bg = theme.colors.primary,
        struts = {top = dpi(32)}
    }

    panel:setup{layout = wibox.layout.fixed.horizontal, tasklist}

    return panel
end

return TaskList
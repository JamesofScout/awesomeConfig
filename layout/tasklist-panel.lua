local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi
local tasklist_widget = require("layout.tasklist")

local function TaskPanel(scr, offset)
    local tasklist = tasklist_widget(scr)
    local offsetX = 0
    local offsetY = 0
    if offset then offsetY = dpi(12, scr) end
    local panel = wibox {
        ontop = false,
        screen = scr,
        visible = true,
        height = dpi(32),
        width = dpi(384),
        x = scr.geometry.x + (scr.geometry.width / 2) - (dpi(384)/2),
        y = scr.geometry.y + offsetY,
        stretch = false,
        bg = theme.colors.background,
        fg = theme.colors.foreground,
        struts = {top = dpi(32, scr)}
    }

    panel:setup{layout = wibox.layout.fixed.horizontal, tasklist}
    panel:struts({top = panel.height + offsetY * 2, left = dpi(8, scr), right = dpi(8, scr), bottom = dpi(8, scr)})

    return panel
end

return TaskPanel
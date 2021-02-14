local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local tasklist_widget = require("layout.tasklist")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
awful.button({ }, 1, function(t) t:view_only() end),
awful.button({ modkey }, 1, function(t)
                            if client.focus then
                            client.focus:move_to_tag(t)
                        end
                    end),
awful.button({ }, 3, awful.tag.viewtoggle),
awful.button({ modkey }, 3, function(t)
                        if client.focus then
                            client.focus:toggle_tag(t)
                        end
                    end),
awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end))

local function TagPanel(scr, offset)
    local taglist = awful.widget.taglist {
        screen  = scr,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        style = {
            border_width = 0,
            border_color = theme.colors.background,
            shape        = gears.shape.square,
            bg_normal = theme.colors.background,
            bg_focus = theme.colors.accent,
            bg_minimize = theme.colors.minimize,
            fg_urgent = theme.colors.foreground_urgent,
            bg_urgent = theme.colors.background
        },
        widget_template = {
            {
                {
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                        font = "Font-Awesome bold 30"
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 10,
                right = 10,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background
        }
    }
    local offsetX = 0
    local offsetY = 0
    if offset then offsetY = dpi(12, scr) end
    local panel = wibox {
        ontop = false,
        screen = scr,
        visible = true,
        height = dpi(32),
        width = dpi(200),
        x = scr.geometry.x + (dpi(40)),
        y = scr.geometry.y + offsetY,
        stretch = true,
        bg = theme.colors.background,
        fg = theme.colors.foreground,
        struts = {top = dpi(32, scr)}
    }

    panel:setup{layout = wibox.layout.align.horizontal, taglist}

    return panel
end

return TagPanel
local awful = require "awful"
local tasklist_panel = require "layout.tasklist-panel"
local clock_panel = require "layout.clock-panel"
local tag_list = require("layout.tag-list")

awful.screen.connect_for_each_screen(function (s)
    awful.tag.add ( "code", {
        icon = "test.png"
    }
    )
    awful.tag({"1","2","3"},s,awful.layout.layouts[1])
    s.clock_panel = clock_panel(s, true)
    s.tag_list = tag_list(s, true)
end)

-- Hide bars when app go fullscreen
function updateBarsVisibility()
   for s in screen do
       if s.selected_tag then
           local fullscreen = s.selected_tag.fullscreenMode
           -- Order matter here for shadow
           s.clock_panel.visible = not fullscreen
           s.tag_list.visible = not fullscreen
       end
   end
end

_G.tag.connect_signal('property::selected',
                      function(t) updateBarsVisibility() end)

_G.client.connect_signal('property::fullscreen', function(c)
    c.screen.selected_tag.fullscreenMode = c.fullscreen
    updateBarsVisibility()
end)

_G.client.connect_signal('unmanage', function(c)
    if c.fullscreen then
        c.screen.selected_tag.fullscreenMode = false
        updateBarsVisibility()
    end
end)
local lunajson = require 'lunajson'
local theme = {}
local colors = io.open(".config/awesome/config/colors.json", "r")
local awful = require("awful")
theme.colors = lunajson.decode(config:read("*a"))
colors:close()

for i=1,#cmds do
    awful.spawn.with_shell(cmds[i]);
end

return theme
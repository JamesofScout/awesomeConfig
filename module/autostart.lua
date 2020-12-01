local lunajson = require 'lunajson'

local config = io.open(".config/awesome/config/autostart.json", "r")
local awful = require("awful")
cmds = lunajson.decode(config:read("*a"))
config:close()

for i=1,#cmds do
    awful.spawn.with_shell(cmds[i]);
end
local lunajson = require 'lunajson'

local config = io.open("config/autostart.json", "r")
local awful = require("awful")

cmds = lunajson.decode(config:read("*a"))

for _,cmd in cmds do
    awful.spawn.with_shell(cmd);
end
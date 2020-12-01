local lunajson = require 'lunajson'
local theme = {}
local colors = io.open(".config/awesome/config/colors.json", "r")
local awful = require("awful")
theme.colors = lunajson.decode(colors:read("*a"))
colors:close()
return theme
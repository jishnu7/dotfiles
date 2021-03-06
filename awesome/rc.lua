-- {{{ Required Libraries

gears           = require("gears")
awful           = require("awful")
awful.rules     = require("awful.rules")
awful.autofocus = require("awful.autofocus")
wibox           = require("wibox")
beautiful       = require("beautiful")
naughty         = require("naughty")
vicious         = require("vicious")
scratch         = require("scratch")

-- }}}

-- {{{ Localization

os.setlocale(os.getenv("LANG"))

-- }}}

require("settings.config")
require("modules.error")
require("settings.startup")
require("modules.signals")
require("modules.clock")
require("modules.music")
require("modules.widgets")
require("modules.layout")
require("settings.wallpaper")
require("settings.keys")
require("settings.apps")
--dofile(awful.util.getdir("config") .. "/settings/apps.lua")

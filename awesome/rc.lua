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
require("settings.keys")
require("settings.apps")
require("modules.signals")
require("modules.clock")
require("modules.music")
require("modules.widgets")
require("modules.layout")


-- {{{ Wallpaper

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

-- }}}

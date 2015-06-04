-- {{{ Autostart

local r = require("../modules/runonce")

r.run("urxvtd")
r.run("unclutter -idle 10")
r.run("xchat")
r.run("setxkbmap -option caps:swapescape")
--r.run("xmodmap ~/.xmodmap")
r.run("fcitx")
r.run("firefox")
r.run("xscreensaver -no-splash")
r.run("geary")
r.run("mpd")
-- turn on numblock
r.run("numlockx")
-- diasble trackpad while typing
r.run("syndaemon -t -k -i 2 -d")
r.run("xfce4-power-manager")
r.run("nm-applet")
r.run("scudcloud")

-- }}}

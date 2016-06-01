-- {{{ Autostart
local r = require("../modules/runonce")


r.run("urxvtd")
r.run("unclutter -idle 10")
r.run("hexchat")
r.run("setxkbmap -option caps:swapescape")
--r.run("xmodmap ~/.xmodmap")
r.run("fcitx")
r.run("firefox")
r.run("xscreensaver -no-splash")
r.run("mpd")
-- turn on numblock
r.run("numlockx")
-- diasble trackpad while typing
r.run("syndaemon -t -k -i 2 -d")
r.run("xfce4-power-manager")
--r.run("nm-applet")

r.run("redshift")
r.run("redshift-gtk")

-- office apps
local day = os.date("*t").wday;
if day > 1 and day < 7 then
    --r.run("slack")
    --r.run("geary")
end
-- }}}

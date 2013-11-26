-- {{{ Variable Definitions

-- Useful Paths
home = os.getenv("HOME")
confdir = home .. "/.config/awesome"
scriptdir = confdir .. "/scripts/"
themes = confdir .. "/themes"
active_theme = themes .. "/powerarrow-darker"

-- Themes define colours, icons, and wallpapers
beautiful.init(active_theme .. "/theme.lua")

terminal = "urxvtc"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
gui_editor = "gedit -ps"
browser = "firefox"
browser2 = "chromium"
mail = terminal .. " -e geary "
chat = terminal .. " -e xchat "
tasks = terminal .. " -e htop "
iptraf = terminal .. " -g 180x54-20+34 -e sudo iptraf-ng -i all "
musicplr = terminal .. " -g 130x34-320+16 -e ncmpcpp "

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,             -- 1
    awful.layout.suit.tile,                 -- 2
    awful.layout.suit.tile.left,            -- 3
    awful.layout.suit.tile.bottom,          -- 4
    awful.layout.suit.tile.top,             -- 5
    awful.layout.suit.fair,                 -- 6
    awful.layout.suit.fair.horizontal,      -- 7
    awful.layout.suit.spiral,               -- 8
    awful.layout.suit.spiral.dwindle,       -- 9
    awful.layout.suit.max,                  -- 10
    --awful.layout.suit.max.fullscreen,     -- 11
    --awful.layout.suit.magnifier           -- 12
}

-- }}}

-- {{{ Tags

-- Define a tag table which hold all screen tags.
tags = {
       names = { "term", "web", "chat", "media", "misc", "mail"},
       layout = { layouts[2], layouts[2], layouts[4], layouts[1], layouts[7], layouts[10] }
       }
for s = 1, screen.count() do
-- Each screen has its own tag table.
   tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}

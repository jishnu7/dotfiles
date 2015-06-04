-- {{{ Rules

awful.rules.rules = {
     -- All clients will match this rule.
     { rule = { },
       properties = { border_width = beautiful.border_width,
                      border_color = beautiful.border_normal,
                      focus = true,
                      keys = clientkeys,
                      buttons = clientbuttons,
                      size_hints_honor = false
                     }
    },

    -- Youtube
    { rule = { instance = "plugin-container" },
        properties = { floating = true } },

    -- Use `xprop` to identify class name
    { rule = { class = "Vlc" },
        properties = { floating = true, ontop = true, sticky = true } },

    { rule = { class = "Umplayer" },
        properties = { floating = true, ontop = true } },

    { rule = { class = "Firefox" },
        properties = { tag = tags[1][2] } },

    { rule = { class = "Iceweasel" },
        properties = { tag = tags[1][2] } },

    { rule = { class = "Chromium" },
        properties = { floating = false, tag = tags[1][2] } },

    { rule = { class = "Geary" },
        properties = { tag = tags[1][6] } },

    { rule = { class = "Xchat" },
        properties = { tag = tags[1][3] } },

    { rule = { class = "Scudcloud" },
        properties = { tag = tags[1][3] } },

    { rule = { class = "Deluge" },
        properties = { tag = tags[1][5] } },

    { rule = { class = "Nautilus" },
        properties = { tag = tags[1][4] } },

    { rule = { class = "Audacious" },
        properties = { floating = true, ontop = true } },

    { rule = { class = "Shotwell" },
        properties = { floating = true } },

    { rule = { class = "Bitcoin" },
        properties = { tag = tags[1][5] } },

    { rule = { class = "VirtualBox" },
        properties = { tag = tags[1][5] } },

}

-- }}}

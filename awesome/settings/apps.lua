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

    { rule_any = { class = { "Umplayer", "Audacious" } },
        properties = { floating = true, ontop = true } },

    { rule_any = { class = { "Firefox", "Iceweasel" } },
        properties = { tag = tags[1][2] } },

    { rule = { class = "Chromium" },
        properties = { floating = false, tag = tags[1][2] } },

    { rule = { class = "Xchat" },
        properties = { tag = tags[1][3] } },

    -- Slack
    { rule = { class = "Scudcloud" },
        properties = { tag = tags[1][3] } },

    { rule = { class = "Nautilus" },
        properties = { tag = tags[1][4] } },

    { rule_any = { class = { "Deluge", "Bitcoin"} },
        properties = { tag = tags[1][5] } },

    { rule = { class = "VirtualBox" },
        except = { name = "Oracle VM VirtualBox Manager" },
        properties = { floating = true, tag = tags[1][5] } },

    { rule = { class = "Geary" },
        properties = { tag = tags[1][6] } },

    { rule_any = { class = {"Shotwell", "feh"} },
        properties = { floating = true } },

    -- Google Keep, Floating Youtube
    { rule_any = { instance = { "crx_hmjkmjkepdijhoojdojkdfohbdgmmhki",
                                "jjphmlaoffndcnecccgemfdaaoighkel" } },
        properties = { floating = true } }
}

-- }}}

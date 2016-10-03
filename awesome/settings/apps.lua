-- {{{ Rules

awful.rules.rules = {
     -- All clients will match this rule.
     { rule = { },
       properties = { border_width = beautiful.border_width,
                      border_color = beautiful.border_normal,
                      focus = true,
                      keys = clientkeys,
                      buttons = clientbuttons,
                      maximized_vertical   = false,
                      maximized_horizontal = false,
                      size_hints_honor = false
                     },
        -- Move child windows to the same screen
        callback = function (c)
            local clients = client.get()
            for i, c2 in pairs(clients) do
                if c.class == c2.class then
                    c.screen = c2.screen
                end

            end
        end
    },

    -- Youtube
    { rule = { instance = "plugin-container" },
        properties = { floating = true } },

    -- Use `xprop` to identify class name
    { rule_any = { class = { "vlc", "Vlc" } },
        properties = { floating = true, ontop = true, sticky = true } },

    { rule = { instance = "crx_gidgenkbbabolejbgbpnhbimgjbffefm" },
        properties = { floating = true, ontop = true, sticky = true } },

    { rule_any = { class = { "Umplayer", "Audacious", "xpad", "MPlayer", "mpv" } },
        properties = { floating = true, ontop = true } },

    { rule_any = { class = { "Firefox", "Iceweasel" } },
        properties = { tag = tags[1][2] } },

    { rule = { class = "Chromium" },
        properties = { floating = false, tag = tags[1][2] } },

    { rule_any = { class = {"Xchat", "Hexchat"} },
        properties = { tag = tags[1][3] } },

    -- Slack
    { rule_any = { class = {"Scudcloud", "Slack"} },
        properties = { tag = tags[1][3] } },

    { rule = { class = "Nautilus" },
        properties = { tag = tags[1][4] } },

    { rule_any = { class = { "Deluge", "Bitcoin"} },
        properties = { tag = tags[1][5] } },

    { rule = { class = "VirtualBox" },
        except = { name = "Oracle VM VirtualBox Manager" },
        properties = { floating = true, tag = tags[1][5] } },

    { rule_any = { class = {"Geary", "Nylas N1"} },
        properties = { tag = tags[1][6] } },

    { rule_any = { class = {"Shotwell", "feh", "Gnome-calendar"} },
        properties = { floating = true } },

    -- Google Keep, Floating Youtube, Pomodoro
    { rule_any = { instance = { "crx_hmjkmjkepdijhoojdojkdfohbdgmmhki",
                                "jjphmlaoffndcnecccgemfdaaoighkel",
                                "crx_hfilbmblidibnmifcabmolhlaekpfhak"
                              } },
        properties = { floating = true } }
}

-- }}}

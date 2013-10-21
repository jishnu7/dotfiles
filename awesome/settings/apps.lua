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

    { rule = { class = "Vlc" },
      properties = { floating = true, ontop = true } },

    { rule = { class = "Terminator" },
          properties = { tag = tags[1][1] } },

    { rule = { class = "Firefox" },
          properties = { tag = tags[1][2] } },

    { rule = { class = "Chromium" },
          properties = { tag = tags[1][2] } },

    { rule = { class = "Xchat" },
          properties = { tag = tags[1][3] } },

    { rule = { class = "Hipchat" },
          properties = { tag = tags[1][5] } },

    { rule = { class = "Deluge" },
          properties = { tag = tags[1][5] } },

    { rule = { class = "Nautilus" },
          properties = { tag = tags[1][4] } },

    { rule = { class = "Audacious" },
      properties = { floating = true, ontop = true } },
}

-- }}}

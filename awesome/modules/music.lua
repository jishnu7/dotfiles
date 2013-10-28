-- Colours
coldef  = "</span>"
colwhi  = "<span color='#b2b2b2'>"
red = "<span color='#e54c62'>"

-- Music widget
mpdwidget = wibox.widget.textbox()
mpdicon = wibox.widget.imagebox()
mpdicon:set_image(beautiful.widget_music)
mpdicon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell(musicplr) end)))

--function music_text(title, artist)
--local len_t=strlenutf8(title)
--local len_a=strlenutf8(artist)
--local total=0
--local re_
--if len_t+len_a>30 then

--end

vicious.register(mpdwidget, vicious.widgets.mpd,
    function(widget, args)
        -- play
        if (args["{state}"] == "Play") then
            mpdicon:set_image(beautiful.widget_music_on)
            return "<span font='Terminus 13' rise='2000'> <span font='Terminus 9'>" .. red .. args["{Title}"] .. coldef .. colwhi .. " - " .. coldef .. colwhi  .. args["{Album}"] .. coldef .. " </span></span>"
        -- pause
        elseif (args["{state}"] == "Pause") then
            mpdicon:set_image(beautiful.widget_music)
            return "<span font='Terminus 13' rise='2000'> <span font='Terminus 9'>" .. colwhi .. "◼" .. coldef .. " </span></span>"
        else
            mpdicon:set_image(beautiful.widget_music)
            return ""
    end
end, 1)


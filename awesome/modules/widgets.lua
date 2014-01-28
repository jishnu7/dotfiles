-- MEM widget
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.widget_mem)
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, ' $2MB ', 13)

-- CPU widget
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.widget_cpu)
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, '<span font="Terminus 13" rise="2000"> <span font="Terminus 9">$1% </span></span>', 3)
cpuicon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(tasks, false) end)))

-- Temp widget
tempicon = wibox.widget.imagebox()
tempicon:set_image(beautiful.widget_temp)
--tempicon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(terminal .. " -e sudo powertop ", false) end)))
tempwidget = wibox.widget.textbox()
vicious.register(tempwidget, vicious.widgets.thermal, '<span font="Terminus 12"> <span font="Terminus 9">$1°C </span></span>', 9, {"coretemp.0", "core"} )
--hddtempwidget = wibox.widget.textbox()
--vicious.register(hddtempwidget, vicious.widgets.hddtemp, '<span font="Terminus 12"> <span font="Terminus 9">${/dev/sda}°C </span></span>', 9)

-- Battery widget
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.widget_battery)

function batstate()

  local file = io.open("/sys/class/power_supply/BAT1/status", "r")

  if (file == nil) then
    return "Cable plugged"
  end

  local batstate = file:read("*line")
  file:close()

  if (batstate == 'Discharging' or batstate == 'Charging') then
    return batstate
  else
    return "Fully charged"
  end
end

batwidget = wibox.widget.textbox()
flag_full = false
vicious.register(batwidget, vicious.widgets.bat,
function (widget, args)
  -- plugged
  if (batstate() == 'Fully charged') then
    if(flag_full == false) then
      flag_full = true
      naughty.notify({
        text = "Battery is full",
        title = "Unplug power to save battery.",
        position = "top_right",
        timeout = 0,
        fg="#000000",
        bg="#ffffff",
        screen = 1,
        ontop = true,
      })
      end
    return '<span font="Terminus 12"> <span font="Terminus 9">Full </span></span>'
  -- critical
  elseif (args[2] <= 5 and batstate() == 'Discharging') then
    baticon:set_image(beautiful.widget_battery_empty)
    naughty.notify({
      text = "going to turn off...",
      title = "Battery is almost empty!",
      position = "top_right",
      timeout = 1,
      fg="#000000",
      bg="#ffffff",
      screen = 1,
      ontop = true,
    })
  -- low
  elseif (args[2] <= 10 and batstate() == 'Discharging') then
    baticon:set_image(beautiful.widget_battery_low)
    naughty.notify({
      text = "Connect the cable!",
      title = "Low battery",
      position = "top_right",
      timeout = 1,
      fg="#ffffff",
      bg="#262729",
      screen = 1,
      ontop = true,
    })
  elseif (batstate() == 'Charging') then
    baticon:set_image(beautiful.widget_ac)
  else baticon:set_image(beautiful.widget_battery)
  end
  flag_full = false
  return '<span font="Terminus 12"> <span font="Terminus 9">' .. args[2] .. '% </span></span>'
end, 1, 'BAT1')

-- Volume widget
volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.widget_vol)
volumewidget = wibox.widget.textbox()
vicious.register(volumewidget, vicious.widgets.volume,
function (widget, args)
  if (args[2] ~= "♩" ) then
      if (args[1] == 0) then volicon:set_image(beautiful.widget_vol_no)
      elseif (args[1] <= 50) then  volicon:set_image(beautiful.widget_vol_low)
      else volicon:set_image(beautiful.widget_vol)
      end
  else volicon:set_image(beautiful.widget_vol_mute)
  end
  return '<span font="Terminus 12"> <span font="Terminus 9">' .. args[1] .. '% </span></span>'
end, 1, "Master")

-- Net widget
netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.net, '<span font="Terminus 13" rise="2000"> <span font="Terminus 9" color="#7AC82E">${wlan0 down_kb}</span> <span font="Terminus 7" color="#EEDDDD">↓↑</span> <span font="Terminus 9" color="#46A8C3">${wlan0 up_kb} </span></span>', 3)
neticon = wibox.widget.imagebox()
neticon:set_image(beautiful.widget_net)


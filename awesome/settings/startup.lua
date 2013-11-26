-- {{{ Autostart

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
 end 

run_once("urxvtd")
run_once("unclutter -idle 10")
run_once("xchat")
run_once("setxkbmap -option caps:swapescape")
--run_once("xmodmap ~/.xmodmap")
run_once("fcitx")
run_once("firefox")
run_once("xscreensaver -no-splash")
run_once("geary")

-- }}}

xrdb -merge ~/.Xresources

# Start a D-Bus session
# Not needed from systemd 226
#source /etc/X11/xinit/xinitrc.d/30-dbus.sh

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export GPG_AGENT_INFO SSH_AUTH_SOCK
dbus-update-activation-environment --systemd DISPLAY

#exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export MOZ_USE_XINPUT2=1
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

exec i3 -V >> ~/.cache/i3/i3log-$(date +'%F-%k-%M-%S') 2>&1

xrdb -merge ~/.Xresources

# Start a D-Bus session
# Not needed from systemd 226
#source /etc/X11/xinit/xinitrc.d/30-dbus.sh
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)

export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

#exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
#

export QT_DEVICE_PIXEL_RATIO=2
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

exec i3 -V >> ~/.cache/i3/i3log-$(date +'%F-%k-%M-%S') 2>&1

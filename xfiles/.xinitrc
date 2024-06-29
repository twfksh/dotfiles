# set wallpaper
/usr/bin/feh --bg-fill ~/.config/backgrounds/rain-artwork-woman.jpg &

# start compositor
/usr/bin/picom &

# start window manager
/usr/local/bin/slstatus &
dbus-run-session /usr/local/bin/dwm

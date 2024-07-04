xset r rate 250 60
# setxkbmap -option caps:escape

# paired with `Xft.dpi: 144`
# export GDK_DPI_SCALE=1.4

if [ -z "${XDG_RUNTIME_DIR}" ]; then
    export XDG_RUNTIME_DIR=/tmp/${USER}-runtime-dir
    if [ ! -d "${XDG_RUNTIME_DIR}" ]; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

picom --config $HOME/.config/picom/picom.conf &
feh --bg-scale $HOME/wallpapers/halloween.png &

sxhkd -c $HOME/.config/sxhkd/sxhkdrc &

# /usr/local/bin/slstatus &
/usr/local/bin/slstatus &
dbus-launch --exit-with-session /usr/local/bin/dwm 

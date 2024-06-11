#!/bin/bash

# set wallpaper
feh --bg-scale ~/Wallpapers/exlxjr.png &&

# start compositor
picom --config ~/.config/qtile/picom.conf &

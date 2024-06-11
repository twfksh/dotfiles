#!/bin/bash

# set wallpaper
feh --bg-scale ~/Wallpapers/gruvbox/ghibli-japanese-walled-garden.png &&

# start compositor
picom --config ~/.config/qtile/picom.conf &

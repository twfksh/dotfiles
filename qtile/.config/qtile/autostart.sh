#!/bin/bash

# set wallpaper
feh --bg-scale ~/Wallpapers/nature.jpg &&

# start compositor
picom --config ~/.config/qtile/picom.conf &

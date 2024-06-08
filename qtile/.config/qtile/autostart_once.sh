#!/bin/bash

# Apply wallpaper using feh
feh --bg-scale $HOME/wallpapers/flowers.png &&

# Start picom
picom --config ~/.config/picom/picom.conf &


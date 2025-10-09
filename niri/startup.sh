#!/bin/sh
swaybg -i ~/.config/niri/wallpapers/wallpaper.png -m stretch &
xwayland-satellite &
alacritty -e tmux

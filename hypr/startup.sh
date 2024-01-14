#!/bin/bash

kitty & swaybg -i ~/.config/hypr/wallpapers/wallpaper.png -m fit &
wl-paste --type text --watch cliphist store &
sh ~/.config/hypr/battery.sh &
mpDris2 & mpd


#!/bin/sh
swaybg -i ~/.config/niri/wallpapers/wallpaper2.jpg -m stretch &
xwayland-satellite &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
kitty -e tmux

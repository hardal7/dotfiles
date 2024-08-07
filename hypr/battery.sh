#!/bin/bash

while true; do
    battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
    if [ $battery_level -lt 5 ]; then
        notify-send "Low Battery" "Battery level is $battery_level%"
    fi
    
    sleep 90
done

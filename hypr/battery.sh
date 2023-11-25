#!/bin/bash

while true; do
    battery_info=$(acpi -b)
    battery_status=$(echo "$battery_info" | awk '{print $3}')
    battery_level=$(echo "$battery_info" | awk '{print $4}' | tr -d ',%')
    
    if [ "$battery_status" == "Discharging," ] && [ $battery_level -lt 20 ]; then
        notify-send "Low Battery" "Battery level is $battery_level%"
    fi
    
    sleep 60
done

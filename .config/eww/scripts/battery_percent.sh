#!/bin/bash

battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)
if [[ $battery_status -eq "Charging" ]]; then
    echo "󰂄 ${battery_percent}%"
else
    echo "󰂀 ${battery_percent}%"
fi

#!/bin/sh
BATNAME="BAT0"
BATTERY_STATUS=$(cat /sys/class/power_supply/$BATNAME/status)
BATTERY_LEVEL=$(cat /sys/class/power_supply/$BATNAME/capacity)

# Low battery alert
if [ "$BATTERY_STATUS" = "Discharging" ] && [ "$BATTERY_LEVEL" -le 20 ]; then
    notify-send -u critical "Battery critical!" "${BATTERY_LEVEL}% - Plug in charger"
fi

# Full battery alert
if [ "$BATTERY_STATUS" = "Charging" ] && [ "$BATTERY_LEVEL" -eq 100 ]; then
    notify-send "Battery Full" "100% - Unplug charger"
fi

#!/bin/bash

if [ "$1" = "wifi" ]; then
    alacritty -e nmtui
elif [ "$1" = "bluetooth" ]; then
    alacritty -e bluetui
fi

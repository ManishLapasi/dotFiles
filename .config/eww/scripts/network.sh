#!/bin/bash

net_status () {
    wifi_name=$(nmcli -t -f STATE,TYPE,CONNECTION device | grep -v "p2p" | grep "wifi" | cut -d: -f3 | cut -c 1-8)
    if (ping -c 1 google.com || ping -c 1 archlinux.org || ping -c 1 github.com) &> /dev/null; then
        echo "󰖩  $wifi_name";
    else
        if [[ -n "$wifi_name" ]]; then
            echo "󱚵  $wifi_name";
        else
            echo "󱚵  None";
        fi
    fi
}

net_status

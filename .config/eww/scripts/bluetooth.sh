#!/bin/bash

bluetooth_status () {
    if (( $(bluetoothctl devices Connected | wc -l) )) ; then
        echo " $( bluetoothctl devices Connected | cut -d ' ' -f 3- | cut -c 1-8 )"
    else 
        echo " None";
    fi
}

bluetooth_status

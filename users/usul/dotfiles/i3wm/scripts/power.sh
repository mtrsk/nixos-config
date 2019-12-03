#!/usr/bin/env bash

list=("Poweroff\nReboot")
option=$(echo -e "$list" | dmenu)

case "$option" in
    "Poweroff")
        poweroff
        ;;
    "Reboot")
        reboot
        ;;
esac

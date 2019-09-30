#!/usr/bin/env bash

list=("Poweroff\nReboot")
category=$(echo -e "$list" | dmenu)

case "$option" in
    "Poweroff")
        poweroff
        ;;
    "Reboot")
        reboot
        ;;
esac

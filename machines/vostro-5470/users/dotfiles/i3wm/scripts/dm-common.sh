#!/usr/bin/env bash

list=("Messages\nDev\nGames\nGraphics\nUtils")
category=$(echo -e "$list" | dmenu)

case "$category" in
  "Messages")
    mlist=("Discord\nTelegram")
    choice=$(echo -e "$mlist" | dmenu)
    case "$choice" in
      Discord)
        Discord
        notify-send "Discord launched"
        ;;
      Telegram)
        telegram-desktop
        notify-send "telegram-desktop launched"
        ;;
    esac
    ;;
  "Dev")
    mlist=("Dbeaver\nInsomnia\nKeepass\nPostman")
    choice=$(echo -e "$mlist" | dmenu)
    case "$choice" in
      Dbeaver)
        dbeaver
        notify-send "Dbeaver launched"
        ;;
      Insomnia)
        insomnia
        notify-send "launched"
        ;;
      Keepass)
        keepass
        notify-send "Keepass launched"
        ;;
      Postman)
        postman
        notify-send "Postman launched"
        ;;
    esac
    ;;
  "Games")
    glist=("Lutris\nRetroArch\nSteam")
    choice=$(echo -e "$glist" | dmenu)
    case "$choice" in
      "Lutris")
        lutris
        notify-send "Lutris launched"
        ;;
      "RetroArch")
        retroarch
        notify-send "RetroArch launched"
        ;;
      "Steam")
        steam
        notify-send "Steam launched"
        ;;
    esac
    ;;
  "Graphics")
    glist=("Gimp\nKrita")
    choice=$(echo -e "$glist" | dmenu)
    case "$choice" in
      "Gimp")
        gimp
        notify-send "Gimp launched"
        ;;
      "Krita")
        krita
        notify-send "Krita launched"
        ;;
    esac
    ;;
  "Utils")
    glist=("Chromium\nTransmission")
    choice=$(echo -e "$glist" | dmenu)
    case "$choice" in
      "Chromium")
        chromium
        notify-send "Chromium launched"
        ;;
      "Transmission")
        transmission-gtk
        notify-send "Transmission launched"
        ;;
    esac
    ;;
esac

#!/usr/bin/env bash

list=("Messages\nDev\nGames\nGraphics\nUtils")
category=$(echo -e "$list" | dmenu)

case "$category" in
  "Messages")
    mlist=("Discord\nTelegram")
    choice=$(echo -e "$mlist" | dmenu)
    case "$choice" in
      Discord)
        notify-send "Discord launched"
        Discord
        ;;
      Telegram)
        notify-send "telegram-desktop launched"
        telegram-desktop
        ;;
    esac
    ;;
  "Dev")
    mlist=("Dbeaver\nInsomnia\nKeepass\nPostman")
    choice=$(echo -e "$mlist" | dmenu)
    case "$choice" in
      Dbeaver)
        notify-send "Dbeaver launched"
        dbeaver
        ;;
      Insomnia)
        notify-send "launched"
        insomnia
        ;;
      Keepass)
        notify-send "Keepass launched"
        keepass
        ;;
      Postman)
        notify-send "Postman launched"
        postman
        ;;
    esac
    ;;
  "Games")
    glist=("Lutris\nRetroArch\nSteam")
    choice=$(echo -e "$glist" | dmenu)
    case "$choice" in
      "Lutris")
        notify-send "Lutris launched"
        lutris
        ;;
      "RetroArch")
        notify-send "RetroArch launched"
        retroarch
        ;;
      "Steam")
        notify-send "Steam launched"
        steam
        ;;
    esac
    ;;
  "Graphics")
    glist=("Gimp\nKrita")
    choice=$(echo -e "$glist" | dmenu)
    case "$choice" in
      "Gimp")
        notify-send "Gimp launched"
        gimp
        ;;
      "Krita")
        notify-send "Krita launched"
        krita
        ;;
    esac
    ;;
  "Utils")
    glist=("Brave\nChromium\nTransmission")
    choice=$(echo -e "$glist" | dmenu)
    case "$choice" in
      "Brave")
        notify-send "Chromium launched"
        brave
        ;;
      "Chromium")
        notify-send "Chromium launched"
        chromium
        ;;
      "Transmission")
        notify-send "Transmission launched"
        transmission-gtk
        ;;
    esac
    ;;
esac

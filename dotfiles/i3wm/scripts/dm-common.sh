#!/usr/bin/env bash

list=("Browsers\nDev\nGames\nGraphics\nMessages\nTools")
category=$(echo -e "$list" | dmenu)

case "$category" in
  "Browsers")
    glist=("Brave\nChromium\nTransmission")
    choice=$(echo -e "$glist" | dmenu)
    case "$choice" in
      "Brave")
        notify-send "Chromium launched"
        brave
        ;;
      "Vimb")
        notify-send "Vimb launched"
        vimb
        ;;
    esac
    ;;
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
    mlist=("DBeaver\nInsomnia")
    choice=$(echo -e "$mlist" | dmenu)
    case "$choice" in
      DBeaver)
        notify-send "DBeaver launched"
        dbeaver
        ;;
      Insomnia)
        notify-send "Insomnia launched"
        insomnia
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
  "Tools")
    glist=("Transmission\n")
    choice=$(echo -e "$glist" | dmenu)
    case "$choice" in
      "Transmission")
        notify-send "Transmission launched"
        transmission-gtk
        ;;
    esac
    ;;
esac

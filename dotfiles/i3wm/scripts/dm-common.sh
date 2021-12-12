#!/usr/bin/env bash

list=("Browsers\nDev\nGames\nGraphics\nMessages\nTools")
category=$(echo -e "$list" | dmenu)

case "$category" in
  "Browsers")
    glist=("Brave\n")
    choice=$(echo -e "$glist" | dmenu)
    case "$choice" in
      "Brave")
        notify-send "Brave launched"
        brave
        ;;
    esac
    ;;
  "Messages")
    mlist=("Discord\nSlack\nSignal\nTelegram")
    choice=$(echo -e "$mlist" | dmenu)
    case "$choice" in
      Discord)
        notify-send "Discord launched"
        Discord
        ;;
      Slack)
        notify-send "slack launched"
        slack
        ;;
      Signal)
        notify-send "signal-desktop launched"
        signal-desktop
        ;;
      Telegram)
        notify-send "telegram-desktop launched"
        env QT_IM_MODULE=xim telegram-desktop
        ;;
    esac
    ;;
  "Dev")
    mlist=("DBeaver\nInsomnia")
    choice=$(echo -e "$mlist" | dmenu)
    case "$choice" in
      "DBeaver")
        notify-send "DBeaver launched"
        dbeaver
        ;;
      "Insomnia")
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
        transmission-qt
        ;;
    esac
    ;;
esac

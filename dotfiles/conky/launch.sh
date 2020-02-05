#!/usr/bin/env bash

CONFIG_PATH="$HOME/NixOS/dotfiles/conky/config"

killall -q -r conky

./update.sh

conky -c "${CONFIG_PATH}"

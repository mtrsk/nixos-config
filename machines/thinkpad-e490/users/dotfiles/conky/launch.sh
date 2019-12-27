#!/usr/bin/env bash
killall -q -r conky

$(pwd)/update.sh

conky -c $HOME/.config/conky/config

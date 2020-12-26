#!/usr/bin/env bash

MONITORS=$(xrandr --query | grep -cE "\sconnected")

if [[ $MONITORS -eq 2 ]]; then
    xrandr \
        --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal \
        --output DP1 --off \
        --output HDMI1 --mode 2560x1080 --pos 1366x0 --rotate normal \
        --output HDMI2 --off \
        --output VIRTUAL1 --off
fi

#!/usr/bin/env bash

load-wallpaper-and-tile() {
    wal -i "$(< "$HOME/.cache/wal/wal")"
    feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
}

load-wallpaper-and-tile

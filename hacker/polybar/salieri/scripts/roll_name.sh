#!/bin/bash

pkill zscroll

zscroll -l 20 \
        --delay 0.8 \
        --match-command "playerctl status 2>/dev/null" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "$HOME/dotfiles/hacker/polybar/salieri/scripts/get_media.sh" &

wait
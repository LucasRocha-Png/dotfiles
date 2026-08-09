#!/bin/bash

pkill -x zscroll

while true; do
    MEDIA=$("$HOME/.config/polybar/salieri/scripts/get_media.sh")

    if [ -n "$MEDIA" ]; then
        if ! pgrep -x "zscroll" > /dev/null; then
            zscroll -l 20 \
                    --delay 0.8 \
                    --match-command "playerctl status 2>/dev/null || echo 'Stopped'" \
                    --match-text "Playing" "--scroll 1" \
                    --match-text "Paused" "--scroll 1" \
                    --match-text "Stopped" "--scroll 1" \
                    --before-text "- " \
                    --update-check true "$HOME/.config/polybar/salieri/scripts/get_media.sh" &
        fi
    else
        if pgrep -x "zscroll" > /dev/null; then
            pkill -x zscroll
        fi
        echo ""
    fi
    
    sleep 2
done
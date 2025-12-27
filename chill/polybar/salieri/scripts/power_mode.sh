#!/bin/bash

# Mostra o modo atual
current=$(powerprofilesctl get)

case "$1" in
    toggle)
        if [ "$current" = "power-saver" ]; then
            powerprofilesctl set balanced
        elif [ "$current" = "balanced" ]; then
            powerprofilesctl set performance
        else
            powerprofilesctl set power-saver
        fi
        ;;
    *)
        case "$current" in
            power-saver)
                echo "ECO"
                ;;
            balanced)
                echo "BAL"
                ;;
            performance)
                echo "PERF"
                ;;
            *)
                echo "?"
                ;;
        esac
        ;;
esac

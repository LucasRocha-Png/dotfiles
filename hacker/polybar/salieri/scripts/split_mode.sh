#!/bin/bash

layout=$(cat ~/.cache/i3/split_mode)

case "$layout" in
    VERTICAL)
        echo "VERTICAL"  
        ;;
    HORIZONTAL)
        echo "HORIZONTAL"
        ;;
    tabbed)
        echo "TAB"
        ;;
    stacked)
        echo "STK"
        ;;
    *)
        echo "?"
        ;;
esac
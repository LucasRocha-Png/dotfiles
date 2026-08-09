#!/bin/bash

# Captura artista e título separadamente
ARTIST=$(playerctl metadata --format "{{ artist }}" 2>/dev/null)
TITLE=$(playerctl metadata --format "{{ title }}" 2>/dev/null)

# Caso tenha os dois
if [ -n "$ARTIST" ] && [ -n "$TITLE" ]; then
    echo " $ARTIST - $TITLE"
# Caso tenha apenas o artista
elif [ -n "$ARTIST" ]; then
    echo "$ARTIST"
# Caso tenha apenas o título
elif [ -n "$TITLE" ]; then
    echo "$TITLE"
# Caso não tenha nada
else
    echo ""
fi
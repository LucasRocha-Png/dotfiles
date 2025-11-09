#!/usr/bin/env bash
files=(~/Pictures/Wallpapers/current/*)  

if (( ${#files[@]} == 0 )); then
    exit 1
fi

WALLPAPER="${files[RANDOM % ${#files[@]}]}"

# aplica com feh
feh --bg-fill "$WALLPAPER"
#feh --bg-scale "$WALLPAPER"
# --bg-fill
# --bg-scale

# Atualiza a imagem do lockscreen
if command -v betterlockscreen >/dev/null 2>&1; then
    betterlockscreen -u "$WALLPAPER"
fi

exit 0

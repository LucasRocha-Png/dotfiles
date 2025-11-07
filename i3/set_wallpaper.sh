#!/usr/bin/env bash
# set_hubble_wallpaper.sh — escolhe um Hubble aleatório, aplica com feh e atualiza betterlockscreen (se instalado)

files=(~/Pictures/Wallpapers/Hubble/*)  # ajuste este caminho se necessário

# se não encontrou arquivos, sai silenciosamente
if (( ${#files[@]} == 0 )); then
    echo "Nenhuma imagem Hubble encontrada em ~~/Pictures/Wallpapers/Hubble" >&2
    exit 1
fi

# escolhe aleatoriamente um elemento do array (lida com espaços)
WALLPAPER="${files[RANDOM % ${#files[@]}]}"

# aplica com feh
feh --bg-scale "$WALLPAPER"
# --bg-fill
# --bg-scale

# se betterlockscreen existir, atualiza a imagem do lockscreen
if command -v betterlockscreen >/dev/null 2>&1; then
    betterlockscreen -u "$WALLPAPER"
fi

exit 0

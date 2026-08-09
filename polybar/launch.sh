#!/usr/bin/env bash

# Add this script to your wm startup file.
DIR="$HOME/.config/polybar/"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Detecta os monitores conectados via xrandr e inicia as barras para cada um
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    # Inicia a barra superior passando a variável do monitor
    MONITOR=$m polybar -q top_pc -c "$DIR"/salieri/config.ini &
    
    # Inicia a barra inferior passando a variável do monitor
    MONITOR=$m polybar -q bottom -c "$DIR"/salieri/config.ini &
  done
else
  # Fallback caso o xrandr não responda
  polybar -q top_pc -c "$DIR"/salieri/config.ini &
  polybar -q bottom -c "$DIR"/salieri/config.ini &
fi
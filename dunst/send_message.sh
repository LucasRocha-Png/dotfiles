#!/bin/bash

pkill dunst 
sleep 1
dunst &

notify-send -u low "Alerta de Baixa Urgência" "Isso é uma notificação de baixa urgência"
sleep 1
notify-send -u normal "Alerta de Urgência Normal" "Isso é uma notificação normal"
sleep 1
notify-send -u critical "Alerta de Urgência Crítica" "Isso é uma notificação crítica"

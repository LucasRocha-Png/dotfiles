#!/bin/bash

DOTFILES=~/dotfiles
CONFIG_DIR=~/.config

BASE_BACKUP_DIR="$HOME/.cache/dotfiles_backups"
mkdir -p "$BASE_BACKUP_DIR"

BACKUP_DIR="$BASE_BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for folder in "$DOTFILES"/*/; do
    folder_name=$(basename "$folder")
    target="$CONFIG_DIR/$folder_name"

    if [ -e "$target" ] || [ -L "$target" ]; then
        mv "$target" "$BACKUP_DIR/"
    fi

    ln -s "$folder" "$target"
done


for file_name in ".bashrc" ".zshrc"; do
    file="$DOTFILES/$file_name"
    target="$HOME/$file_name"

    if [ -e "$file" ]; then
        if [ -e "$target" ] || [ -L "$target" ]; then
            mv "$target" "$BACKUP_DIR/"
        fi

        ln -s "$file" "$target"
    fi
done

#!/bin/bash

DOTFILES=~/dotfiles/hacker
CONFIG_DIR=~/.config

BASE_BACKUP_DIR="$HOME/.cache/dotfiles_backups"
mkdir -p "$BASE_BACKUP_DIR"

BACKUP_DIR="$BASE_BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for folder in "$DOTFILES"/*/; do
    folder_name=$(basename "$folder")
    
    case "$folder_name" in
        ".vscode")
            target="$HOME/$folder_name"
            ;;
        *)
            target="$CONFIG_DIR/$folder_name"
            ;;
    esac

    if [ -e "$target" ] || [ -L "$target" ]; then
        mv "$target" "$BACKUP_DIR/"
    fi

    ln -s "$folder" "$target"
done


for file_name in ".bashrc" ".zshrc" ".xprofile" ".Xresources"; do
    file="$DOTFILES/$file_name"
    target="$HOME/$file_name"

    if [ -e "$file" ]; then
        if [ -e "$target" ] || [ -L "$target" ]; then
            mv "$target" "$BACKUP_DIR/"
        fi

        ln -s "$file" "$target"
    fi
done

sudo xrdb -merge ~/.Xresources

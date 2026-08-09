#!/bin/bash

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR=~/.config

# Garante que o diretório .config exista antes de tentar linkar coisas nele
mkdir -p "$CONFIG_DIR"

BASE_BACKUP_DIR="$HOME/.cache/dotfiles_backups"
mkdir -p "$BASE_BACKUP_DIR"

BACKUP_DIR="$BASE_BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# --- CORREÇÃO IMPORTANTE ---
# Permite que o loop enxergue arquivos ocultos (começados com .)
shopt -s dotglob

for folder in "$DOTFILES"/*/; do
    # Remove a barra final da variável folder para o basename funcionar direito
    folder="${folder%/}"
    folder_name=$(basename "$folder")
    
    # Ignora as pastas "." e ".." caso apareçam, e o diretório .git
    if [ "$folder_name" == "." ] || [ "$folder_name" == ".." ] || [ "$folder_name" == ".git" ]; then
        continue
    fi
    
    case "$folder_name" in
        ".vscode")
            # Se for .vscode, vai para a home
            target="$HOME/$folder_name"
            ;;
        "ly")
            # O ly vai direto para /etc/ (exige sudo)
            target="/etc/ly"
            ;;
        *)
            # O resto vai para .config
            target="$CONFIG_DIR/$folder_name"
            ;;
    esac

    # Lógica de Backup (tratando o ly com sudo por causa do /etc)
    if [ "$folder_name" == "ly" ]; then
        if [ -e "$target" ] || [ -L "$target" ]; then
            echo "Fazendo backup de $target para $BACKUP_DIR"
            sudo mkdir -p "$BACKUP_DIR/ly_backup"
            sudo mv "$target" "$BACKUP_DIR/ly_backup/"
        fi
        echo "Criando link com sudo: $folder -> $target"
        sudo ln -s "$folder" "$target"
    else
        if [ -e "$target" ] || [ -L "$target" ]; then
            echo "Fazendo backup de $target para $BACKUP_DIR"
            mv "$target" "$BACKUP_DIR/"
        fi
        echo "Criando link: $folder -> $target"
        ln -s "$folder" "$target"
    fi
done

# Desativa o dotglob para não afetar o resto do script (boa prática)
shopt -u dotglob

# --- ARQUIVOS SOLTOS ---

for file_name in ".bashrc" ".zshrc" ".xprofile" ".Xresources" ".visidatarc"; do
    file="$DOTFILES/$file_name"
    target="$HOME/$file_name"

    if [ -e "$file" ]; then
        if [ -e "$target" ] || [ -L "$target" ]; then
            echo "Fazendo backup de $target"
            mv "$target" "$BACKUP_DIR/"
        fi

        echo "Linkando arquivo: $file_name"
        ln -s "$file" "$target"
    fi
done

if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi
echo "Configuração concluída!"

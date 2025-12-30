#!/bin/bash

DOTFILES=~/dotfiles/hacker
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
    
    # Ignora as pastas "." e ".." caso apareçam
    if [ "$folder_name" == "." ] || [ "$folder_name" == ".." ]; then
        continue
    fi
    
    case "$folder_name" in
        ".vscode")
            # Se for .vscode, vai para a home
            target="$HOME/$folder_name"
            ;;
        *)
            # O resto vai para .config
            target="$CONFIG_DIR/$folder_name"
            ;;
    esac

    # Lógica de Backup
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Fazendo backup de $target para $BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
    fi

    # Criação do Link Simbólico
    echo "Criando link: $folder -> $target"
    ln -s "$folder" "$target"
done

# Desativa o dotglob para não afetar o resto do script (boa prática)
shopt -u dotglob

# --- ARQUIVOS SOLTOS ---

for file_name in ".bashrc" ".zshrc" ".xprofile" ".Xresources"; do
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

sudo xrdb -merge ~/.Xresources
echo "Configuração concluída!"
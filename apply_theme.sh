#!/bin/bash

# Define paths
DOTFILES_DIR="$HOME/dotfiles"
THEME_FILE="$DOTFILES_DIR/colors/theme.sh"
CACHE_FILE="$HOME/.cache/current_theme_state"

# Source the colors
if [ -f "$THEME_FILE" ]; then
    source "$THEME_FILE"
else
    echo "Error: $THEME_FILE not found!"
    exit 1
fi

echo "Applying theme..."
echo "Primary Color: $PRIMARY_COLOR"
echo "Background: $BG_COLOR"

# Read previous colors to know what to replace in generated files
if [ -f "$CACHE_FILE" ]; then
    source "$CACHE_FILE"
else
    # Defaults from initial Oomox generation
    export PREV_PRIMARY="#19cb00"
    export PREV_BG="#000000"
    export PREV_URGENT="#cc0403"
    export PREV_SECONDARY="#0c6500"
fi

# 1. Update i3 config
I3_CONFIG="$DOTFILES_DIR/i3/config"
if [ -f "$I3_CONFIG" ]; then
    sed -i -E "s/client\.focused .*/client.focused          $PRIMARY_COLOR $PRIMARY_COLOR $BG_COLOR $PRIMARY_COLOR $PRIMARY_COLOR/" "$I3_CONFIG"
    sed -i -E "s/client\.focused_inactive .*/client.focused_inactive $BG_COLOR $BG_COLOR $PRIMARY_COLOR #333333 $BG_COLOR/" "$I3_CONFIG"
    sed -i -E "s/client\.unfocused .*/client.unfocused        $BG_COLOR $BG_COLOR $PRIMARY_COLOR #222222 $BG_COLOR/" "$I3_CONFIG"
    sed -i -E "s/client\.urgent .*/client.urgent           $URGENT_COLOR $URGENT_COLOR $PRIMARY_COLOR $URGENT_COLOR $URGENT_COLOR/" "$I3_CONFIG"
    echo "Updated i3 config"
fi

# 2. Update Rofi
ROFI_COLORS="$DOTFILES_DIR/rofi/shared/colors.rasi"
if [ -f "$ROFI_COLORS" ]; then
    sed -i -E "s/background:[[:space:]]+.*/background:     $BG_COLOR;/" "$ROFI_COLORS"
    sed -i -E "s/background-alt:[[:space:]]+.*/background-alt: $BG_COLOR;/" "$ROFI_COLORS"
    sed -i -E "s/foreground:[[:space:]]+.*/foreground:     $PRIMARY_COLOR;/" "$ROFI_COLORS"
    sed -i -E "s/selected:[[:space:]]+.*/selected:       $PRIMARY_COLOR;/" "$ROFI_COLORS"
    sed -i -E "s/active:[[:space:]]+.*/active:         $PRIMARY_COLOR;/" "$ROFI_COLORS"
    sed -i -E "s/urgent:[[:space:]]+.*/urgent:         $URGENT_COLOR;/" "$ROFI_COLORS"
    echo "Updated Rofi colors"
fi

# 3. Update Kitty (direto no kitty.conf)
KITTY_CONF="$DOTFILES_DIR/kitty/kitty.conf"
if [ -f "$KITTY_CONF" ]; then
    sed -i -E "s/^background .*/background $BG_COLOR/" "$KITTY_CONF"
    sed -i -E "s/^foreground .*/foreground $FG_COLOR/" "$KITTY_CONF"
    echo "Updated Kitty colors"
fi

# 4. Update Zsh Gentoo Theme
ZSH_THEME="$DOTFILES_DIR/gentoo-custom.zsh-theme"
if [ -f "$ZSH_THEME" ]; then
    sed -i -E "s/PROMPT='%\(\!\.%B%F\{[^}]*\}\.%B%F\{[^}]*\}/PROMPT='%(!.%B%F{$URGENT_COLOR}.%B%F{$PRIMARY_COLOR}/" "$ZSH_THEME"
    echo "Updated Zsh theme"
fi

# 5. Update VSCode Oomox Theme
VSCODE_THEME="$DOTFILES_DIR/colors/themes/base16/oomox-rocha_theme.json"
if [ -f "$VSCODE_THEME" ]; then
    # Search and replace the previous primary color with the new one
    sed -i "s/$PREV_PRIMARY/$PRIMARY_COLOR/gI" "$VSCODE_THEME"
    sed -i "s/$PREV_BG/$BG_COLOR/gI" "$VSCODE_THEME"
    sed -i "s/$PREV_URGENT/$URGENT_COLOR/gI" "$VSCODE_THEME"
    sed -i "s/$PREV_SECONDARY/$SECONDARY_COLOR/gI" "$VSCODE_THEME"
    
    # Also copy it to the vscode extensions dir if it exists there
    VSCODE_EXT_DIR="$HOME/.vscode/extensions"
    if [ -d "$VSCODE_EXT_DIR" ]; then
        find "$VSCODE_EXT_DIR" -type f -name "oomox-rocha_theme.json" -exec cp "$VSCODE_THEME" {} \;
    fi
    echo "Updated VSCode colors"
fi

# 6. Update Polybar
POLYBAR_CONFIG="$DOTFILES_DIR/polybar/salieri/config.ini"
if [ -f "$POLYBAR_CONFIG" ]; then
    sed -i -E "s/^foreground = .*/foreground = $PRIMARY_COLOR/" "$POLYBAR_CONFIG"
    sed -i -E "s/^primary = .*/primary = $PRIMARY_COLOR/" "$POLYBAR_CONFIG"
    sed -i -E "s/^alert = .*/alert = $URGENT_COLOR/" "$POLYBAR_CONFIG"
    sed -i -E "s/^secondary = .*/secondary = $SECONDARY_COLOR/" "$POLYBAR_CONFIG"
    echo "Updated Polybar"
fi

# 7. Update Dunst
DUNST_CONFIG="$DOTFILES_DIR/dunst/dunstrc"
if [ -f "$DUNST_CONFIG" ]; then
    sed -i "s/$PREV_PRIMARY/$PRIMARY_COLOR/g" "$DUNST_CONFIG"
    sed -i "s/$PREV_BG/$BG_COLOR/g" "$DUNST_CONFIG"
    sed -i "s/$PREV_URGENT/$URGENT_COLOR/g" "$DUNST_CONFIG"
    echo "Updated Dunst"
fi

# 8. Update Visidata
VISIDATA_RC="$DOTFILES_DIR/.visidatarc"
if [ ! -f "$VISIDATA_RC" ]; then
    # Create default visidatarc if it doesn't exist
    echo "options.color_default = '$PRIMARY_COLOR $BG_COLOR'" > "$VISIDATA_RC"
    echo "options.color_default_hdr = '$PRIMARY_COLOR $BG_COLOR'" >> "$VISIDATA_RC"
    echo "options.color_menu = '$BG_COLOR $PRIMARY_COLOR'" >> "$VISIDATA_RC"
    echo "options.color_status = '$PRIMARY_COLOR $BG_COLOR'" >> "$VISIDATA_RC"
fi
# Update existing visidatarc
sed -i -E "s/options\.color_default .*/options.color_default = '$PRIMARY_COLOR $BG_COLOR'/" "$VISIDATA_RC"
sed -i -E "s/options\.color_default_hdr .*/options.color_default_hdr = '$PRIMARY_COLOR $BG_COLOR'/" "$VISIDATA_RC"
sed -i -E "s/options\.color_menu .*/options.color_menu = '$BG_COLOR $PRIMARY_COLOR'/" "$VISIDATA_RC"
sed -i -E "s/options\.color_status .*/options.color_status = '$PRIMARY_COLOR $BG_COLOR'/" "$VISIDATA_RC"
echo "Updated Visidata"

# 9. Update Micro Editor Theme
MICRO_THEME="$DOTFILES_DIR/micro/colorschemes/arch_verde.micro"
if [ -f "$MICRO_THEME" ]; then
    sed -i "s/$PREV_PRIMARY/$PRIMARY_COLOR/gI" "$MICRO_THEME"
    sed -i "s/$PREV_BG/$BG_COLOR/gI" "$MICRO_THEME"
    sed -i "s/$PREV_URGENT/$URGENT_COLOR/gI" "$MICRO_THEME"
    sed -i "s/$PREV_SECONDARY/$SECONDARY_COLOR/gI" "$MICRO_THEME"
    echo "Updated Micro Editor"
fi

# 10. Update Kitty Oomox Theme (just to keep it synced)
KITTY_OOMOX="$DOTFILES_DIR/colors/oomox-rocha_theme.conf"
if [ -f "$KITTY_OOMOX" ]; then
    sed -i "s/$PREV_PRIMARY/$PRIMARY_COLOR/gI" "$KITTY_OOMOX"
    sed -i "s/$PREV_BG/$BG_COLOR/gI" "$KITTY_OOMOX"
    sed -i "s/$PREV_URGENT/$URGENT_COLOR/gI" "$KITTY_OOMOX"
    sed -i "s/$PREV_SECONDARY/$SECONDARY_COLOR/gI" "$KITTY_OOMOX"
fi


# 11. Update GTK/QT Themes and Icons (Oomox)
GTK_THEME_DIR="$DOTFILES_DIR/.themes/oomox-rocha_theme"
ICON_THEME_DIR="$DOTFILES_DIR/.icons/oomox-rocha_theme"

if [ -d "$GTK_THEME_DIR" ]; then
    find "$GTK_THEME_DIR" -type f -exec sed -i "s/$PREV_PRIMARY/$PRIMARY_COLOR/gI" {} +
    find "$GTK_THEME_DIR" -type f -exec sed -i "s/$PREV_BG/$BG_COLOR/gI" {} +
    find "$GTK_THEME_DIR" -type f -exec sed -i "s/$PREV_URGENT/$URGENT_COLOR/gI" {} +
    find "$GTK_THEME_DIR" -type f -exec sed -i "s/$PREV_SECONDARY/$SECONDARY_COLOR/gI" {} +
    echo "Updated GTK/QT Themes"
fi

if [ -d "$ICON_THEME_DIR" ]; then
    find "$ICON_THEME_DIR" -type f -exec sed -i "s/$PREV_PRIMARY/$PRIMARY_COLOR/gI" {} +
    find "$ICON_THEME_DIR" -type f -exec sed -i "s/$PREV_BG/$BG_COLOR/gI" {} +
    find "$ICON_THEME_DIR" -type f -exec sed -i "s/$PREV_URGENT/$URGENT_COLOR/gI" {} +
    find "$ICON_THEME_DIR" -type f -exec sed -i "s/$PREV_SECONDARY/$SECONDARY_COLOR/gI" {} +
    echo "Updated Icons"
fi

# Save current state for next time
cat <<EOF > "$CACHE_FILE"
export PREV_PRIMARY="$PRIMARY_COLOR"
export PREV_BG="$BG_COLOR"
export PREV_URGENT="$URGENT_COLOR"
export PREV_SECONDARY="$SECONDARY_COLOR"
EOF

echo ""
echo "=> Reloading services..."
# Reload i3
if command -v i3-msg >/dev/null 2>&1; then
    i3-msg reload >/dev/null
    echo "i3 reloaded"
fi
# Reload Polybar (supondo que o launch.sh do i3/polybar se encarregue se for derrubado ou precisando relançar manual)
if command -v polybar >/dev/null 2>&1; then
    # Muitas vezes o script launch.sh cuida de reabrir, se não:
    pkill polybar
    ~/dotfiles/polybar/launch.sh >/dev/null 2>&1 &
    echo "Polybar reloaded"
fi

# Reload Dunst
if command -v dunst >/dev/null 2>&1; then
    pkill dunst
    # Dunst will be restarted automatically via DBus on the next notification
    # But we can start it explicitly just in case
    dunst &
    echo "Dunst reloaded"
fi

# Note for Kitty
echo "For kitty, please restart your terminal or use the kitty reload shortcut."

echo "Theme applied successfully!"

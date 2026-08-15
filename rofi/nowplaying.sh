#!/bin/bash

#####################################
## author @Harsh-bin Github #########
## modified by antigravity   #########
#####################################

# --- Configuration ---
art_file="$HOME/.config/rofi/nowplaying/album_art.png"
fallback_art_file="$HOME/.config/rofi/nowplaying/fallback_album_art.png"
rofi_theme="$HOME/.config/rofi/nowplaying/nowplaying.rasi"
cache_file="$HOME/.config/rofi/nowplaying/song_title.cache"

# --- Functions ---

# Determine active player
players_list=$(playerctl -l 2>/dev/null)
active_player=""
active_player_priority=0 

while IFS= read -r player; do
if [ -z "$player" ]; then continue; fi

status=$(playerctl -p "$player" status 2>/dev/null | tr '[:upper:]' '[:lower:]')
title=$(playerctl -p "$player" metadata title 2>/dev/null)

current_priority=0

    if [ "$status" == "playing" ]; then
        current_priority=3
    elif [ "$status" == "paused" ]; then
        current_priority=2
    elif [ -n "$title" ]; then
        current_priority=1
    else
        current_priority=0
    fi

if [ "$current_priority" -gt "$active_player_priority" ]; then
    active_player="$player"
    active_player_priority=$current_priority
fi

done <<< "$players_list"

# Clean up art and cache files if no active player 
if [[ -z "$active_player" ]]; then
    rm "$art_file" 2>/dev/null
    rm "$cache_file" 2>/dev/null    
fi

# Fetch Data 
song_title="Nothing Playing"
song_artist="Unknown"
song_album=""
player_display_name=""
progress_str=""

# Function to escape special characters 
escape_characters() {
    echo "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'
}

if [[ -n "$active_player" ]]; then
    # Retrieve metadata 
    raw_title=$(playerctl -p "$active_player" metadata title 2>/dev/null)
    raw_artist=$(playerctl -p "$active_player" metadata artist 2>/dev/null)
    raw_album=$(playerctl -p "$active_player" metadata xesam:album 2>/dev/null)
    
    # Progress Calculation
    position=$(playerctl -p "$active_player" position 2>/dev/null)
    length=$(playerctl -p "$active_player" metadata mpris:length 2>/dev/null)
    if [[ -n "$position" && -n "$length" && "$length" -gt 0 ]]; then
        progress_str=$(awk -v pos="$position" -v len="$length" 'BEGIN {
            pos_s = pos;
            len_s = len / 1000000;
            printf "[ %02d:%02d / %02d:%02d ]", pos_s/60, pos_s%60, len_s/60, len_s%60
        }')
    fi
    
    # Escape special characters 
    clean_name="${active_player%%.*}" 
    clean_name="$(tr '[:lower:]' '[:upper:]' <<< ${clean_name:0:1})${clean_name:1}"
    player_display_name=$(escape_characters "$clean_name")
    song_title=$(escape_characters "$raw_title")
    song_artist=$(escape_characters "$raw_artist")
    song_album=$(escape_characters "$raw_album")

    # Handle album_art_url output
    cached_title=""
    if [[ -f "$cache_file" ]]; then
        cached_title=$(cat "$cache_file")
    fi
    if [[ "$raw_title" != "$cached_title" ]] || [[ ! -f "$art_file" ]]; then
        echo "$raw_title" > "$cache_file"

        album_art_url=$(playerctl -p "$active_player" metadata mpris:artUrl 2>/dev/null)
        track_url=$(playerctl -p "$active_player" metadata xesam:url 2>/dev/null)

        if [[ -z "$album_art_url" && -n "$track_url" ]]; then
            if [[ "$track_url" =~ youtube\.com/watch\?v=([a-zA-Z0-9_-]+) ]]; then
                yt_id="${BASH_REMATCH[1]}"
                album_art_url="https://img.youtube.com/vi/${yt_id}/mqdefault.jpg"
            elif [[ "$track_url" =~ youtu\.be/([a-zA-Z0-9_-]+) ]]; then
                yt_id="${BASH_REMATCH[1]}"
                album_art_url="https://img.youtube.com/vi/${yt_id}/mqdefault.jpg"
            fi
        fi

        if [[ -z "$album_art_url" ]]; then
            # Case 0: No art URL found -> use fallback art file
            cp "$fallback_art_file" "$art_file" 2>/dev/null
        elif [[ "$album_art_url" =~ ^data:image ]]; then
            # Case 1: Base64 Data URI
            base64_data=$(echo "$album_art_url" | cut -d',' -f2)
            echo "$base64_data" | base64 -d > "$art_file" 2>/dev/null
        elif [[ "$album_art_url" =~ ^file:// ]]; then
            # Case 2: Standard URL (file://) for browsers   
            raw_path="${album_art_url#file://}"
            # Use Python for reliable URL decoding
            decoded_path=$(python3 -c "import urllib.parse, sys; print(urllib.parse.unquote(sys.argv[1]))" "$raw_path" 2>/dev/null)
            if [[ -f "$decoded_path" ]]; then
                cp "$decoded_path" "$art_file"
            else
                cp "$fallback_art_file" "$art_file" 2>/dev/null
            fi
        elif [[ "$album_art_url" =~ ^https?:// ]]; then
            # Case 3: Web URL (now supporting http and following redirects)
            curl -sL "$album_art_url" --output "$art_file"
        fi
    fi
fi

pre=""
toogle=""
next=""
player_status=""
notify_status="Paused"

status=$(playerctl -p "$active_player" status 2>/dev/null)
if [[ "$status" != "Playing" ]]; then
    toogle=""
    player_status="Paused"
    notify_status="Playing"    
fi

# Build Pango formatted display text
display_text="<span weight='bold' size='large'>${song_title}</span>\n"
display_text+="<span size='small' alpha='80%'>${song_artist}</span>"

if [[ -n "$song_album" && "$song_album" != "Unknown" ]]; then
    display_text+="\n<span size='x-small' style='italic' alpha='60%'>${song_album}</span>"
fi

if [[ -n "$progress_str" ]]; then
    display_text+="\n<span size='x-small' alpha='50%'>${progress_str}</span>"
fi

display_text+="\n\n<span size='x-small' alpha='50%'>${player_display_name} ${player_status}</span>"

# --- Launch Rofi ---
selected_option=$(echo -e "$pre\n$toogle\n$next" | rofi -dmenu \
    -theme "$rofi_theme" \
    -theme-str "textbox-custom { str: \"$display_text\"; }" \
    -select "$toogle")

case "$selected_option" in
    "$pre") 
        playerctl -p "$active_player" previous 
        notify-send "$player_display_name Skipped" "\n$song_title - $song_artist" --icon="$art_file"
        ;;
    "$toogle") 
        playerctl -p "$active_player" play-pause 
        notify-send "$player_display_name $notify_status" "\n$song_title - $song_artist" --icon="$art_file"
        ;;
    "$next")
        playerctl -p "$active_player" next      
        notify-send "$player_display_name Skipped" "\n$song_title  - $song_artist" --icon="$art_file"
        ;;
esac
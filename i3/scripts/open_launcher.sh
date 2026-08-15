#!/usr/bin/env bash
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
rofi -modi "drun,💻 Development:~/.config/rofi/modes/Dev.sh,⚙️ System:~/.config/rofi/modes/Sys.sh,🎮 Game:~/.config/rofi/modes/Game.sh,🎬 Media:~/.config/rofi/modes/Media.sh,📝 Office:~/.config/rofi/modes/Office.sh,🛠️ Engineering:~/.config/rofi/modes/Eng.sh,🎓 Education:~/.config/rofi/modes/Edu.sh,🎨 Graphics:~/.config/rofi/modes/Graph.sh,🌐 Network:~/.config/rofi/modes/Net.sh,🔬 Science:~/.config/rofi/modes/Sci.sh,🧰 Utility:~/.config/rofi/modes/Util.sh,🎛️ Settings:~/.config/rofi/modes/Set.sh" \
     -show drun \
     -theme ~/.config/rofi/launcher.rasi
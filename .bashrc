#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
[ -r /home/salieri/.config/byobu/prompt ] && . /home/salieri/.config/byobu/prompt   #byobu-prompt#

export QSYS_ROOTDIR="/home/salieri/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/25.1/quartus/sopc_builder/bin"
export TERMINAL=kitty

alias microphone='cd ~/Applications/audiosource && ./audiosource run'

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/salieri/.lmstudio/bin"
# End of LM Studio CLI section

alias reconstrucao='cd /home/salieri/Desktop/UFMG/Tesla/Reconstrucao-2025 && make -j run'
export EDITOR="micro"
export VISUAL="micro"

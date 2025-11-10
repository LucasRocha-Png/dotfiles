#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
[ -r /home/salieri/.config/byobu/prompt ] && . /home/salieri/.config/byobu/prompt   #byobu-prompt#

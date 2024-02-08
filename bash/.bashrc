#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

PS1='\[\e[01;32m\]\u\[\e[00m\] \[\e[1;34m\]\w\[\e[0m\] > '

#PS1='\[\e[1;34m\]\w\[\e[0m\]\n '

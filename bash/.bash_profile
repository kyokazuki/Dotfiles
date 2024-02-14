#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# editor
export EDITOR=nvim

# ranger
export RANGER_LOAD_DEFAULT_RC=false 

# japanese input method settings
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx5 &

# start X11
startx

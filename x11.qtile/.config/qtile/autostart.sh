#!/bin/sh

# mouse and keyboard settings
unclutter -idle 2 &
xset r rate 250 40
setxkbmap -option caps:swapescape
xinput set-prop '8' 'libinput Accel Speed' -0.8
xbindkeys

picom &

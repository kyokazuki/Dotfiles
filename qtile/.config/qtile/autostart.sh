#!/bin/sh
# mouse and display settings
unclutter -idle 2 &
xrandr --output HDMI-A-0 --mode 1920x1080 --rate 144
xset r rate 250 40
setxkbmap -option caps:swapescape
xinput set-prop '8' 'libinput Accel Speed' -0.8
xbindkeys

picom &

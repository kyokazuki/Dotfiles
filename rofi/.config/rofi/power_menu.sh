#!/bin/sh
list=(
  "󰒲 Suspend"      "systemctl suspend"
  "󰍃 Logout"       "pkill -KILL -u $(whoami)"
  " Reboot"       "systemctl reboot"
  " Shutdown"     "systemctl poweroff"
)

if selected="$(for (( i=0; i<=$((${#list[@]}/2-1)); i++ )) { echo "${list[($i+1)*2-2]}"; } | rofi -dmenu -i -p ' >' -format i)"; then
  [[ "$selected" -ge 0 ]] && eval "${list[($selected+1)*2-1]}"
fi
# ~/.dwm/autostart.sh
setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle, grp_led:caps'
nitrogen --restore
xfce4-power-manager &
xfce4-volumed &
#xxkb &
xfce4-notifyd &
xmodmap ~/.xmodmaprc
conky | while read -r; do xsetroot -name "$REPLY"; done &
(sleep 1; compton -cfF) &

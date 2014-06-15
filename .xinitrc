
#!/bin/sh
#xset b off
(sleep 1; compton -cfC) &
#xfce4-notifyd &
DEFAULT_SESSION=openbox-session

case $1 in
xmonad)
    exec /usr/bin/xmonad
    ;;
openbox)
	exec openbox-session
	;;
*)
	exec $DEFAULT_SESSION
	;;
esac


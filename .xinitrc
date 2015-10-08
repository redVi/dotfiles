#!/bin/sh
xset b off
xrdb -load ~/.Xdefaults
(sleep 1; compton -cCGb -r-0 -r-0 -r9 -o.50) &

DEFAULT_SESSION=openbox-session

case $1 in
bspwm)
        exec bspwm
        ;;
openbox)
	exec openbox-session
	;;
*)
	exec $DEFAULT_SESSION
	;;
esac

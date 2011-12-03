#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# disable screensaver/powersaving monitor
xset s off &
setterm -blank 0 -powersave off -powerdown 0 & 

# load Xsession scripts (e.g., keytouch)
/etc/X11/Xsession &

# load .Xresources -- only necessary since I'm using XTerm as my emulator
xrdb -load ~/.Xresources &

# START A WINDOW MANAGER (required, otherwise x jsut quits)
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
DEFAULT_SESSION=awesome
case $1 in
  awesome|openbox) exec $1 ;;
  *) exec $DEFAULT_SESSION ;;
esac

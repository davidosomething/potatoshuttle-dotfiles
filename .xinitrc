#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi
# load my .Xresources and modmap -- includes fixes for xterm
if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# load everything in xinitrc.d folder
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# disable screensaver/powersaving monitor
xset s off &
setterm -blank 0 -powersave off -powerdown 0 &

# clipboard manager (DE/WM independent so not in openbox autostart)
parcellite &

# custom script to keep a tmux session alive when X is running
/home/davidosomething/bin/persist-tmux.sh &

# START A WINDOW MANAGER (required, otherwise x jsut quits)
# exec gnome-session
# exec awesome
exec openbox-session

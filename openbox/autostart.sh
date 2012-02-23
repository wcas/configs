# Openbox Autostart Script

# Set our dual-monitor/resolution (we should check which monitors we have enabled in the future)
if which xrandr </dev/null >/dev/null 2>&1; then
  DISPLAY_NUM=`xrandr -q |grep -e "^\(VGA\|DVI\)" |wc -l | awk '{print $1}'`
  if [ $DISPLAY_NUM -eq 2 ]; then
    xrandr --auto --output DVI-0 --mode 1920x1080 --refresh 75.0 --primary --output VGA-0 --mode 1440x900 --refresh 60.0 --above DVI-0
  fi
fi

# Background
# Check if feh has been told to use a specific background file already
if which feh </dev/null >/dev/null 2>&1; then
  if [ -e $HOME/.fehbg ]; then
    eval `cat $HOME/.fehbg` & 
  fi
fi

# XComp Manager
if which xcompmgr </dev/null >/dev/null 2>&1; then
  (sleep 2 && xcompmgr -r 4 -c -f -C -t 3 -l 3 -D 5) &
fi

# Tint2
if which tint2 </dev/null >/dev/null 2>&1; then
  (sleep 2 && tint2 -c ~/.config/tint2/tint2rc ) & 
fi

# Keepassx
if which keepassx </dev/null >/dev/null 2>&1; then
  (sleep 2 && keepassx ) &
fi

# HP-SysTray
if which hp-systray </dev/null >/dev/null 2>&1; then
  (sleep 2 && hp-systray ) &
fi

# Screensaver
if which xscreensaver </dev/null >/dev/null 2>&1; then
  (sleep 2 && xscreensaver -nosplash ) &
fi

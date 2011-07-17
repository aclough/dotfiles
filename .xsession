eval $(gnome-keyring-daemon --start --components=secrets)
nm-applet &
xfce4-power-manager
xfce4-volumed
halevt
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Escape"
xmodmap -e "add mod5 = XF86WakeUp"
exec awesome

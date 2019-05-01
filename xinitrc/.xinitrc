vmware-user-suid-wrapper
systemctl --user import-environment DISPLAY
#systemctl restart --user ssh-socks-proxy.service
setxkbmap -layout de,us -variant nodeadkeys, -option grp:alt_shift_toggle
hash nm-applet 2>/dev/null && nm-applet &
exec i3


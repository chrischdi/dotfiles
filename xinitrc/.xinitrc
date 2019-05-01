vmware-user-suid-wrapper
systemctl --user import-environment DISPLAY
#systemctl restart --user ssh-socks-proxy.service
setxkbmap -layout de,us -variant nodeadkeys, -option grp:alt_shift_toggle
exec i3


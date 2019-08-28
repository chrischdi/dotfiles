#!/bin/bash

xrandr --newmode "2560x1440_41.00" 163.711 2560 2608 2640 2720 1440 1443 1448 1468 -hsync -vsync
xrandr --addmode HDMI-1 "2560x1440_41.00"
xrandr --output HDMI-1 --mode "2560x1440_41.00"
xrandr --output eDP-1 --off

feh --bg-fill ${HOME}/Pictures/.wallpaper
i3-msg reload
i3-msg restart


#!/bin/bash

xrandr --newmode "2560x1440_41.00" 163.711 2560 2608 2640 2720 1440 1443 1448 1468 -hsync -vsync
xrandr --addmode HDMI1 "2560x1440_41.00"
xrandr --output HDMI1 --mode "2560x1440_41.00"
xrandr --output eDP1 --mode "1920x1080"
xrandr --output eDP1 --right-of HDMI1

feh --bg-fill ${HOME}/Pictures/.wallpaper
i3-msg reload
i3-msg restart


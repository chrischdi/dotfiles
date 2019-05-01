#!/bin/bash

xrandr --output eDP1 --pos 0x0 --mode 1920x1080
xrandr --output HDMI1 --same-as eDP1

feh --bg-fill ${HOME}/Pictures/.wallpaper
i3-msg reload
i3-msg restart


#!/bin/bash
# src: pacmd list-sources | grep 'name:'
MIC="alsa_input.usb-R__DE_Microphones_R__DE_NT-USB_Mini_97710491-00.mono-fallback"
pacmd set-default-source $MIC

pacmd unload-module module-loopback
pacmd unload-module module-null-sink
pacmd unload-module module-ladspa-sink
pacmd unload-module module-remap-source

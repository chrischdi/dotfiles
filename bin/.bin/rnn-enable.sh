#!/bin/bash

# src: pacmd list-sources | grep 'name:'
MIC="alsa_input.usb-R__DE_Microphones_R__DE_NT-USB_Mini_97710491-00.mono-fallback"
LATENCY_MSEC=1
LADSPA_CONTROL=80

# load RNN
pacmd load-module module-null-sink sink_name=mic_denoised_out sink_properties="device.description='RNN-Microphone-Sink'"
pacmd load-module module-ladspa-sink sink_name=mic_raw_in sink_master=mic_denoised_out label=noise_suppressor_mono plugin=/opt/cadmus/librnnoise_ladspa.so control=${LADSPA_CONTROL} sink_properties="device.description='RNN-Raw-Microphone-Redirect'"
pacmd load-module module-loopback latency_msec=${LATENCY_MSEC} source="${MIC}" sink=mic_raw_in channels=1
pacmd load-module module-remap-source master=mic_denoised_out.monitor source_name=denoised source_properties="device.description='RNN-Denoised-Microphone-(USEME)'"

# set RNN as default device
pacmd set-default-source denoised

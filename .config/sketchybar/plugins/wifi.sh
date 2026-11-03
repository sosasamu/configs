#!/bin/bash
# Wi-Fi connected / disconnected. macOS hides the network name from apps without location access.
if ipconfig getifaddr en0 >/dev/null; then
  sketchybar --set "$NAME" icon="󰖩" icon.color=0xffcdd6f4
else
  sketchybar --set "$NAME" icon="󰖪" icon.color=0xfff38ba8
fi

#!/bin/bash
# Shows "WM" while the AeroSpace leader mode (Caps Lock) waits for a key.
if [ "$(aerospace list-modes --current)" = "wm" ]; then
  sketchybar --set "$NAME" drawing=on
else
  sketchybar --set "$NAME" drawing=off
fi

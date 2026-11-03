#!/bin/bash
# Highlights the focused workspace. $1 = workspace id.
FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"
if [ "$1" = "$FOCUSED" ]; then
  sketchybar --set "$NAME" background.drawing=on
else
  sketchybar --set "$NAME" background.drawing=off
fi

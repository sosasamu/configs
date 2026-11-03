#!/bin/bash
# Slack unread badge (same number as the Dock). Red when there is something unread.
LABEL="$(lsappinfo info -only StatusLabel "Slack" | sed -n 's/.*"label"="\(.*\)".*/\1/p')"
if [ -n "$LABEL" ]; then
  sketchybar --set "$NAME" icon.color=0xfff38ba8 label="$LABEL" label.drawing=on
else
  sketchybar --set "$NAME" icon.color=0xffcdd6f4 label.drawing=off
fi

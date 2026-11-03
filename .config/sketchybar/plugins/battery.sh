#!/bin/bash
# Battery percentage with an icon by level; lightning bolt while charging.
INFO="$(pmset -g batt)"
PERCENT="$(echo "$INFO" | grep -Eo '[0-9]+%' | tr -d '%')"
[ -z "$PERCENT" ] && exit 0

case "$PERCENT" in
  9[0-9]|100) ICON="" ;;
  [6-8][0-9]) ICON="" ;;
  [3-5][0-9]) ICON="" ;;
  [1-2][0-9]) ICON="" ;;
  *) ICON="" ;;
esac
echo "$INFO" | grep -q 'AC Power' && ICON=""

sketchybar --set "$NAME" icon="$ICON" label="${PERCENT}%"

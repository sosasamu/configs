#!/bin/bash
# Volume icon and percentage. $INFO = volume (0-100) on volume_change.
VOLUME="${INFO:-$(osascript -e 'output volume of (get volume settings)')}"
MUTED="$(osascript -e 'output muted of (get volume settings)')"

case "$VOLUME" in
  [6-9][0-9]|100) ICON="󰕾" ;;
  [3-5][0-9]) ICON="󰖀" ;;
  [1-9]|[1-2][0-9]) ICON="󰕿" ;;
  *) ICON="󰖁" ;;
esac
[ "$MUTED" = "true" ] && ICON="󰖁"

sketchybar --set "$NAME" icon="$ICON" label="${VOLUME}%"

#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch
if (polybar --list-monitors | grep "DP-0"); then
  polybar --reload left &
fi
if (polybar --list-monitors | grep "DP-4"); then
  polybar --reload right &
fi
echo "Bar launched..."

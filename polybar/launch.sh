#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch
if (polybar --list-monitors | grep "DP-1-2"); then
  polybar --reload chonk &
fi
if (polybar --list-monitors | grep "DP-1"); then
  polybar --reload ultrawide &
fi
if (polybar --list-monitors | grep "eDP-1"); then
  polybar --reload internal &
fi
echo "Bar launched..."

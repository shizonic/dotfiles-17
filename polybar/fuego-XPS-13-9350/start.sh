#!/usr/bin/env sh


MONITORS=$(xrandr -q| grep " connected" | wc -l)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top &

if [ $MONITORS = '2' ]; then
    polybar external_top &
fi

polybar bottom &

echo "Bars launched..."

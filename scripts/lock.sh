#!/bin/sh

# Terminate already running bar instances
killall xss-lock

# Wait until the processes have been shut down
while pgrep -u $UID -x xss-lock >/dev/null; do sleep 1; done

xss-lock --transfer-sleep-lock -- /usr/bin/i3lock-fancy -f "FiraCode-Nerd-Font-Bold" --nofork -- maim

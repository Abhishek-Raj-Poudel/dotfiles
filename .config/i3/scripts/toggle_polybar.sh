#!/bin/bash

# Requires: xprop, xdotool, polybar

while true; do
    focused_window=$(xdotool getwindowfocus getwindowname)

    if [ "$focused_window" != "" ]; then
        # Hide polybar
        polybar-msg cmd hide
    else
        # Show polybar
        polybar-msg cmd show
    fi

    sleep 1  # check every second
done

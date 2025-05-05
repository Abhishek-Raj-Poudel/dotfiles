#!/bin/bash

while true; do
    # Get window count on current workspace
    window_count=$(i3-msg -t get_tree | jq '.. | select(.type?) | select(.type=="workspace" and .focused==true) | .nodes | length')

    if [ "$window_count" -gt 0 ]; then
        polybar-msg cmd hide
    else
        polybar-msg cmd show
    fi

    sleep 1
done

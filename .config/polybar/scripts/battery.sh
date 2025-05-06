#!/bin/bash

# Get battery information
BATTERY_PATH="/sys/class/power_supply/BAT1"

# Allow overriding the battery path with an argument (optional but good practice)
if [ -n "$1" ]; then
  BATTERY_PATH="/sys/class/power_supply/$1"
fi

# Check if the battery directory exists
if [ ! -d "$BATTERY_PATH" ]; then
  # Try finding the first BAT* directory if BAT1 doesn't exist
  BATTERY_PATH=$(find /sys/class/power_supply/ -name 'BAT*' | head -n 1)
  if [ ! -d "$BATTERY_PATH" ]; then
    echo "󰂑 Error" # Battery error icon
    exit 1
  fi
fi

# Read capacity and status, handle potential read errors
capacity=$(cat "$BATTERY_PATH/capacity" 2>/dev/null)
status=$(cat "$BATTERY_PATH/status" 2>/dev/null)

# Check if reads were successful
if [ -z "$capacity" ] || [ -z "$status" ]; then
  echo "󰂑 Error" # Battery error icon
  exit 1
fi

# --- Corrected Logic ---

# 1. Handle the "Full" state first
if [ "$status" = "Full" ]; then
  echo "󰁹 $capacity%" # Use the filled battery icon often used for "Full"

# 2. Handle the "Charging" or "Unknown" (often means plugged in but not full) states
elif [ "$status" = "Charging" ] || [ "$status" = "Unknown" ]; then
  if [ "$capacity" -le 10 ]; then
    echo "󰢜 $capacity%" # Charging bolt + 10%
  elif [ "$capacity" -le 20 ]; then
    echo "󰂆 $capacity%" # Charging bolt + 20%
  elif [ "$capacity" -le 30 ]; then
    echo "󰂇 $capacity%" # Charging bolt + 30%
  elif [ "$capacity" -le 40 ]; then
    echo "󰂈 $capacity%" # Charging bolt + 40%
  elif [ "$capacity" -le 50 ]; then
    echo "󰢝 $capacity%" # Charging bolt + 50%
  elif [ "$capacity" -le 60 ]; then
    echo "󰂉 $capacity%" # Charging bolt + 60%
  elif [ "$capacity" -le 70 ]; then
    echo "󰢞 $capacity%" # Charging bolt + 70%
  elif [ "$capacity" -le 80 ]; then
    echo "󰂊 $capacity%" # Charging bolt + 80%
  elif [ "$capacity" -le 90 ]; then
    echo "󰂋 $capacity%" # Charging bolt + 90%
  else # Implicitly capacity > 90 and <= 100
    echo "󰁹 $capacity%" # Charging bolt + 100% (use the full charging icon)
 fi

# 3. Handle the "Discharging" state
elif [ "$status" = "Discharging" ]; then
  if [ "$capacity" -le 10 ]; then
    echo "󰁺 $capacity%" # 10%
  elif [ "$capacity" -le 20 ]; then
    echo "󰁻 $capacity%" # 20%
  elif [ "$capacity" -le 30 ]; then
    echo "󰁼 $capacity%" # 30%
  elif [ "$capacity" -le 40 ]; then
    echo "󰁽 $capacity%" # 40%
  elif [ "$capacity" -le 50 ]; then
    echo "󰁾 $capacity%" # 50%
  elif [ "$capacity" -le 60 ]; then
    echo "󰁿 $capacity%" # 60%
  elif [ "$capacity" -le 70 ]; then
    echo "󰂀 $capacity%" # 70%
  elif [ "$capacity" -le 80 ]; then
    echo "󰂁 $capacity%" # 80%
  elif [ "$capacity" -le 90 ]; then
    echo "󰂂 $capacity%" # 90%
  else # Implicitly capacity > 90 and <= 100
    echo "󰁹" # Show nothing if full 
 fi

# 4. Handle any other unexpected status
else
  echo "? $capacity%" # Indicate unknown status
fi

exit 0

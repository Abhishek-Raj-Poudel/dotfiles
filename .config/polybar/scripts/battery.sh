#!/bin/bash

# Get battery information
#!/bin/bash

# Get battery information
BATTERY_PATH="/sys/class/power_supply/BAT1"

if [ ! -d "$BATTERY_PATH" ]; then
  echo "Battery not found"
  exit 1
fi

capacity=$(cat "$BATTERY_PATH/capacity")
status=$(cat "$BATTERY_PATH/status")

# Format the output based on status and capacity
if [ "$status" != "Discharging" ]; then
  if [ "$capacity" -le 10 ]; then
    echo "󰢜 $capacity%"
  elif [ "$capacity" -le 20 ]; then
    echo "󰂆 $capacity%"
  elif [ "$capacity" -le 30 ]; then
    echo "󰂇 $capacity%"
  elif [ "$capacity" -le 40 ]; then
    echo "󰂈 $capacity%"
  elif [ "$capacity" -le 50 ]; then
    echo "󰢝 $capacity%"
  elif [ "$capacity" -le 60 ]; then
    echo "󰂉 $capacity%"
  elif [ "$capacity" -le 70 ]; then
    echo "󰢞 $capacity%"
  elif [ "$capacity" -le 80 ]; then
    echo "󰂊 $capacity%"
  elif [ "$capacity" -le 90 ]; then
    echo "󰂋 $capacity%"
  elif [ "$capacity" -le 100 ]; then
    echo "󰂋 $capacity%"
  else
    echo "󰂄"
  fi
elif [ "$status" = "Full" ]; then
  echo "󰂄" 
else
  if [ "$capacity" -le 10 ]; then
    echo "󰁺 $capacity%"
  elif [ "$capacity" -le 20 ]; then
    echo "󰁻 $capacity%"
  elif [ "$capacity" -le 30 ]; then
    echo "󰁼 $capacity%"
  elif [ "$capacity" -le 40 ]; then
    echo "󰁽 $capacity%"
  elif [ "$capacity" -le 50 ]; then
    echo "󰁾 $capacity%"
  elif [ "$capacity" -le 60 ]; then
    echo "󰁿 $capacity%"
  elif [ "$capacity" -le 70 ]; then
    echo "󰂀 $capacity%"
  elif [ "$capacity" -le 80 ]; then
    echo "󰂁 $capacity%"
  elif [ "$capacity" -le 90 ]; then
    echo "󰂂 $capacity%"
  elif [ "$capacity" -le 100 ]; then
    echo "󰂂 $capacity%"
  else
    echo "󰁹"
  fi
fi

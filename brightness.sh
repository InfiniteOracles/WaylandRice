#!/bin/bash
# Get current and max brightness from brightnessctl (using intel_backlight device)
current=$(brightnessctl -d intel_backlight get)
max=$(brightnessctl -d intel_backlight max)

if [ "$max" -eq 0 ]; then
  echo "0"
  exit 0
fi

percent=$(( 100 * current / max ))
echo "$percent"

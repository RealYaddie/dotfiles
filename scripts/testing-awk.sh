#!/bin/bash

variable=$(xrandr | awk '/^LVDS/ {print $1}')
match="LVDS-1"

if [ "$variable" = "$match" ]; then
    echo "The variable is LVDS-1"
else
    echo "The variable is not LVDS-1"
fi

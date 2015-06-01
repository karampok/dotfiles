#!/bin/sh

xrandr --output VGA1 --off --output LVDS1 --auto

i3-nagbar -m "PICKING SCREENS" -t warning \
-b "HOME"  "xrandr --output LVDS1 --auto --output VGA1 --auto --left-of LVDS1" \
-b "LAPTOP" "xrandr  --output LVDS1 --auto --output VGA1 --off" \
-b "VGA ONLY"  "xrandr --output LVDS1 --off --output VGA1--auto"

#!/bin/sh
EXTERNAL_OUTPUT="DP1"
INTERNAL_OUTPUT="LVDS1"
DOCK_OUTPUT="HDMI3"

case "$1" in
    dock)
        xrandr --output $INTERNAL_OUTPUT --off --output $DOCK_OUTPUT --auto
        ;;
    external)
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
        ;;
    internal)
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
        ;;
    clone)
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
        ;;
    all)
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
        ;;
    *)
        echo "Usage: $0 {internal|external|dock|clone|all}"
        exit 2
esac

nitrogen --restore
exit 0

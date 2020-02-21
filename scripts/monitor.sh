#!/bin/sh
SCREEN_1="VGA-1"
SCREEN_2="VGA-2"

case "$1" in
    single)
        xrandr --output $SCREEN_1 --auto --output $SCREEN_2 --off
        ;;
    dual)
        xrandr --output $SCREEN_1 --auto --output $SCREEN_2 --auto --right-of $SCREEN_1
        ;;
    *)
        echo "Usage: $0 {single|dual}"
        exit 2
esac

nitrogen --restore
exit 0

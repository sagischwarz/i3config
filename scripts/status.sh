#!/bin/sh
case "$1" in
    logout)
        i3-msg exit
        ;;
    suspend)
        dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.Suspend" boolean:true
        ;;
    reboot)
        dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.Reboot" boolean:true
        ;;
    shutdown)
        dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.PowerOff" boolean:true
        ;;
    *)
        echo "Usage: $0 {logout|suspend|reboot|shutdown}"
        exit 2
esac

exit 0

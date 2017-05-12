#!/bin/sh -e
scrot /tmp/screen_locked.png
mogrify -scale 5% -scale 2000% /tmp/screen_locked.png
i3lock -e -i /tmp/screen_locked.png

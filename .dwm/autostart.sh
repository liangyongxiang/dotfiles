#!/bin/bash

exec goldendict &
exec firefox &
exec telegram-desktop &
exec st -e tmux new -A -s work &
exec irccloud &
exec thunderbird &
#exec hugo-start &

exec ~/.dwm/xsetloop.sh

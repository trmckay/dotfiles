#!/bin/bash

# start a program only if it is not already running
function on_startup() {
    if pgrep -x $(basename $1) > /dev/null; then
        echo "$(basename $1) already running."
    else
        echo "$(basename $1) not running."
        shift
        echo "Executing '$@'."
        eval "$@" &
    fi
}

function on_reload() {
    echo "Killing $(basename $1)."
    pkill -x $(basename $1)
    sleep 1
    shift
    echo "Executing $@."
    eval "$@" &
}

# polybar
on_reload polybar polybar main

# keybinding daemon
on_startup sxhkd sxhkd

# wallpaper
on_reload nitrogen nitrogen --restore

# redshift
on_startup redshift redshift -l 35.282753:-120.659615

on_startup udiskie udiskie

on_startup xautolock xautolock -detectsleep -time 10 -corners ---- -locker i3lock-fancy

on_reload dunst dunst

on_startup picom picom --daemon

on_startup polkit-gnome-au /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

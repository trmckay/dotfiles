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

on_reload nitrogen nitrogen --restore

on_reload polybar polybar main

on_startup sxhkd sxhkd

on_startup redshift redshift -l 35.282753:-120.659615

on_startup udiskie udiskie

on_startup xss-lock xss-lock --ignore-sleep -- i3lock-fancy

on_reload dunst dunst

on_startup picom picom --daemon

on_startup nextcloud nextcloud

on_startup polkit-gnome-au /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

on_startup xfsettingsd xfsettingsd

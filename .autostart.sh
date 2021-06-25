#!/bin/bash

# start a program only if it is not already running
function on_startup() {
    if [ "$1" == "-o" ]; then
        PATTERN="$2"
        shift 2
    else
        PATTERN="$1"
    fi
    pgrep -x $PATTERN > /dev/null
    if [ $? != 0 ]; then
        echo "$@"
        eval "$@" &
    else
        echo "$1 already running"
    fi
}

function on_reload() {
    if [ "$1" == "-o" ]; then
        PATTERN="$2"
        shift 2
    else
        PATTERN="$1"
    fi
    pkill $PATTERN
    echo "$@"
    eval "$@" &
}

# polybar
# ~/.config/polybar/launch.sh .config/polybar/polybar.ini

# keybinding daemon
on_startup sxhkd

# wallpaper
nitrogen --restore &

# redshift
# on_startup redshift -l 35.282753:-120.659615

# on_startup udiskie

on_startup xautolock -detectsleep -time 10 -corners ---- -locker i3lock

on_reload dunst

on_startup picom \
    --daemon \
    --shadow \
    --vsync \
    --fading \
    --fade-out-step=1 \
    --fade-in-step=0.028 \
    --fade-delta=5 \
    --shadow-radius=16

#!/bin/bash

set -e

HOME_FILES="$(find . -maxdepth 1 -name "\.*" -type f -not -name ".gitignore")"
CONFIG_FILES="$(find .config -maxdepth 1)"
CONFIG_DIR="$HOME/.config"

for FILE in $HOME_FILES; do
ln -svf "$(pwd)/$FILE" "$HOME"
done

for FILE in $CONFIG_FILES; do
ln -svf "$(pwd)/$FILE" "$CONFIG_DIR"
done

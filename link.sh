#!/bin/bash

set -e

HOME_FILES="$(find . -maxdepth 1 -name "\.*" -type f -not -name ".gitignore")"
CONFIG_FILES="$(find .config -maxdepth 1)"
CONFIG_DIR="$HOME/.config"
SCRIPTS_DIR="scripts"

for FILE in $HOME_FILES; do
ln -svf "$(pwd)/$FILE" "$HOME"
done

for FILE in $CONFIG_FILES; do
ln -svf "$(pwd)/$FILE" "$CONFIG_DIR"
done

mkdir -p "$HOME"/.local/bin

for FILE in "$SCRIPTS_DIR"/*; do
ln -svf "$(pwd)/$FILE" "$HOME/.local/bin"
done

set +e

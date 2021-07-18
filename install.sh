#!/bin/bash

set -x

function install_packages() {
    if command -v dnf; then
        PKG_PREFIX="sudo dnf upgrade -y && sudo dnf install -y"
        PKG_FILE="./extras/pkg_lists/fedora.txt"
    elif command -v apt-get; then
        PKG_PREFIX="sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install -y"
        PKG_FILE="./extras/pkg_lists/ubuntu.txt"
    elif command -v brew; then
        PKG_PREFIX="brew update && brew install"
        PKG_FILE="./extras/pkg_lists/homebrew.txt"
    fi

    if [ -n "$PKG_PREFIX" ]; then
        eval "$PKG_PREFIX" "$(cat $PKG_FILE | sed ':a;N;$!ba;s/\n/ /g')"
    fi
}

function zsh_setup() {
    touch ~/.bw
    curl -sL --proto-redir -all,https \
        https://raw.githubusercontent.com/zplug/installer/master/installer.zsh |\
	zsh
    zsh -i -c zplug install
    chsh -s "$(which zsh)"
}

install_packages || echo "Failed to install packages."
zsh_setup || echo "Failed to setup ZSH."

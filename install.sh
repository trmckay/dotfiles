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

function neovim_setup() {
    git clone https://github.com/neovim/neovim
    cd neovim || exit 1
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    sudo ln -svf /usr/local/bin/nvim /usr/local/bin/vim
    sudo ln -svf /usr/local/bin/nvim /usr/local/bin/vi
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    zsh -c 'nvim -c PlugInstall -c UpdateRemotePlugins -c qa!'
    cd ..
    rm -rf neovim
}

function zsh_setup() {
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    zplug install
    curl -fsSL https://starship.rs/install.sh | bash
    touch ~/.bw
    chsh -s "$(which zsh)"
}

function misc_packages() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env

    sudo npm install -g $(cat extras/pkg_lists/npm.txt)
}

install_packages || echo "Failed to install packages."
zsh_setup || echo "Failed to setup ZSH."
neovim_setup || echo "Failed to setup Neovim."
misc_packages || echo "Failed to install extras."

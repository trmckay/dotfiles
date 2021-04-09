#!/bin/bash

function get_distro() {
    cat /etc/*-release | uniq -u
}

function install_packages() {
    set -e

    if get_distro | grep -qe fedora; then
        UPDATE_CMD="sudo dnf update"
        INSTALL_CMD="sudo dnf install"
        PKG_FILE="./fedora_packages.txt"
    elif get_distro | grep -qe ubuntu; then
        UPDATE_CMD="sudo apt update -y && sudo apt upgrade -y"
        INSTALL_CMD="sudo apt install"
        PKG_FILE="./ubuntu_packages.txt"
    else
        exit 1
    fi

    eval "$UPDATE_CMD"
    eval "$INSTALL_CMD" "$(cat $PKG_FILE)"

    set +e
}

function neovim_setup() {
    set -e

    mdkir .working
    cd .working
    git clone https://github.com/neovim/neovim
    cd neovim

    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install

    sudo ln -s /usr/local/bin/nvim /usr/local/bin/vim
    sudo ln -s /usr/local/bin/nvim /usr/local/bin/vi

    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    nvim -c PlugClean -c PlugUpdate -c CocUpdate -c PlugInstall -c UpdateRemotePlugins -c qa!

    cd ../..
    rm -rf .working

    set +e
}

function zsh_setup() {
    set -e

    curl -fsSL https://starship.rs/install.sh | bash

    SAVE_DIR="$(pwd)"
    cd "$HOME"

    mkdir -p .zsh
    cd .zsh
    git clone https://github.com/jeffreytse/zsh-vi-mode.git
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    cd ..

    cd "$SAVE_DIR"

    chsh -s "$(which zsh)"

    set +e
}

function link() {
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
}

function fonts() {
    set -e

    git clone https://github.com/ryanoasis/nerd-fonts
    cd nerd-fonts
    ./install.sh meslo hack fira-code inconsolata terminus
    cd ..
    rm -rf nerd-fonts

    set +e
}

install_packages || echo "Failed to install packages!"
link || echo "Failed to link configuration files!"
zsh_setup || echo "Failed to setup ZSH."
neovim_setup || echo "Failed to setup Neovim"

shift 1
for ARG in "$@"; do
    if [ "$ARG" == "--fonts" ]; then
        fonts
    fi
done

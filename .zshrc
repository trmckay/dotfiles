#!/bin/zsh

function sources() {
    source $HOME/.aliases
    source $HOME/.zsh_functions
}

function options() {
    export TERM=xterm-256color
    setopt correct
}
function plugins() {
    ZSH_THEME=""
    plugins=(git colored-man-pages z)
    source ~/.oh-my-zsh/oh-my-zsh.sh

    # starship prompt (included in packages)
    eval "$(starship init zsh)"
    export STARSHIP_CONFIG=~/.config/starship.toml

    # syntax-highlighting
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # vi-mode
    source ~/.zsh/zsh-vi-mode/zsh-vi-mode.zsh
}

function keybindings() {
    # Better searching in command mode
    bindkey -M vicmd '?' history-incremental-search-backward
    bindkey -M vicmd '/' history-incremental-search-forward

    # Beginning search with arrow keys
    bindkey '^[[A' up-line-or-search
    bindkey '^[[B' down-line-or-search

    # fzf keybindings
    source /usr/share/fzf/shell/key-bindings.zsh
}

# initialize keybindings after vi-mode
function zvm_after_init() {
    keybindings
}

# init in-order
init() {
    sources
    options
    plugins
    # keybindings
}

init

# tmux on ssh sessions
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
    exec tmux new-session -A -s SSH;
fi

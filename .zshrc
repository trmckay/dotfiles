#!/bin/zsh

function sources() {
    source $HOME/.aliases
    source $HOME/.zsh_functions
}

function options() {
    export TERM=xterm-256color
    setopt correct
    #load colors
    autoload colors && colors
    for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
        eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
        eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
    done
    eval RESET='%{$reset_color%}'
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
    # bindkey -M vicmd '?' history-incremental-search-backward
    # bindkey -M vicmd '/' history-incremental-search-forward

    # Beginning search with arrow keys
    # bindkey '^[[A' up-line-or-search
    # bindkey '^[[B' down-line-or-search

    # fzf keybindings
    source /usr/share/fzf/shell/key-bindings.zsh 2> /dev/null ||\
    source /usr/share/doc/fzf/examples/key-bindings.zsh

    bindkey -s '^o' 'nvim $(fzf)^M'
    bindkey -s '^f' 'clear; term="" && vared -p "${RED}ripgrep${RESET}: " -c term && rg -H "$term"^M'
    bindkey -s '^e' 'clear; term="" && vared -p "${GREEN}fd-find${RESET}: " -c term && fd "$term"^M'
    bindkey -s '^n' 'tn^M'
}

# initialize keybindings after vi-mode
function zvm_after_init() {
    keybindings
}

# init in-order
init() {
    options
    plugins
    keybindings
    sources
}

init

# TMUX with new sessions
if [[ -z "$TMUX" ]]; then
    if [[ -n "$PS1" ]] && [[ -n "$SSH_CONNECTION" ]]; then
        exec tmux new-session -A -s SSH;
    fi
fi

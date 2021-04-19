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
    bindkey -M vicmd '?' history-incremental-search-backward
    bindkey -M vicmd '/' history-incremental-search-forward

    # Beginning search with arrow keys
    bindkey '^[[A' up-line-or-search
    bindkey '^[[B' down-line-or-search

    # fzf keybindings
    source /usr/share/fzf/shell/key-bindings.zsh 2> /dev/null ||\
    source /usr/share/doc/fzf/examples/key-bindings.zsh
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

# TMUX with new sessions
if [[ -z "$TMUX" ]]; then
    if [[ -n "$PS1" ]] && [[ -n "$SSH_CONNECTION" ]]; then
        exec tmux new-session -A -s SSH;
    fi

    pfetch
    vared -p '${CYAN}[tmux]${RESET} Name session: ' -c SESSION_NAME

    if [[ -n "$SESSION_NAME" ]] && [[ -z "$TMUX" ]]; then
        exec tmux new-session -A -s $SESSION_NAME;
    fi

    clear
fi

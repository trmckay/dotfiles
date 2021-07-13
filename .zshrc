#!/bin/zsh

source $HOME/.aliases
source $HOME/.zsh_functions

setopt correct

HISTFILE=$HOME/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

# Directory navigation
setopt autocd autopushd pushdignoredups

# Completion
autoload -U compinit && compinit
setopt automenu menucomplete
zstyle ':completion:::::' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 2

# Starship prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

source $HOME/.zplug/init.zsh

zplug "jeffreytse/zsh-vi-mode"
zplug "mdumitru/fancy-ctrl-z"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "mdumitru/git-aliases"
zplug "zpm-zsh/tmux"
zplug "zsh-users/zsh-completions"
zplug "unixorn/fzf-zsh-plugin"

TMUX_AUTOSTART=false
TMUX_MOTD=false

export KEYTIMEOUT=1

zplug load

function post_init() {
    # Start a tmux session.
    function _tmux {
        session=$(tmux ls 2> /dev/null | fzf --print-query | cut -d':' -f1)
        exists=$(echo $session | wc -l)
        if [ $exists -ne 2 ]; then
            session=$(echo $session | head -1)
            if [ "$session" == "" ]; then
                return 1
            fi
            cd "$(fd -t d '.*' . | fzf)" || return 1
        else
            session=$(echo $session | tail -1)
        fi
        tmux new-session -A -s "$session" || return 1
    }
    bindkey -s '^n' '_tmux^M'

    # Open a file in nvim.
    bindkey -s '^o' 'nvim $(fzf)^M'

    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

zvm_after_init_commands+=('post_init')

eval "$(zoxide init zsh)"

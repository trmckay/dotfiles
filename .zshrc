#!/bin/zsh

source $HOME/.aliases
source $HOME/.zsh_functions

setopt correct

# Directory navigation.
setopt autocd autopushd pushdignoredups

# Completion
autoload -U compinit && compinit
setopt automenu menucomplete
zstyle ':completion:::::' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 2

# starship prompt (included in packages)
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

eval "$(fasd --init auto)"

bindkey -s '^o' 'nvim $(fzf)^M'
bindkey -s '^f' 'clear; term="" && vared -p "${RED}ripgrep${RESET}: " -c term && rg -H "$term"^M'
bindkey -s '^e' 'clear; term="" && vared -p "${GREEN}fd-find${RESET}: " -c term && fd "$term"^M'
bindkey -s '^n' 'tn^M'

source ~/.zplug/init.zsh

zplug "mdumitru/fancy-ctrl-z"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "mdumitru/git-aliases"
zplug "zpm-zsh/tmux"
zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-completions"
zplug "wookayin/fzf-fasd"
zplug "unixorn/fzf-zsh-plugin"

if [[ "$(hostname)" == "mbp.local" ]]; then
    zplug "joow/macos"
    zplug "digitalraven/omz-homebrew"
fi

TMUX_AUTOSTART=false
TMUX_MOTD=true

export KEYTIMEOUT=1

zplug load

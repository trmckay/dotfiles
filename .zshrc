#!/bin/zsh

source $HOME/.aliases
source $HOME/.zsh_functions

setopt correct

# starship prompt (included in packages)
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

bindkey -s '^o' 'nvim $(fzf)^M'
bindkey -s '^f' 'clear; term="" && vared -p "${RED}ripgrep${RESET}: " -c term && rg -H "$term"^M'
bindkey -s '^e' 'clear; term="" && vared -p "${GREEN}fd-find${RESET}: " -c term && fd "$term"^M'
bindkey -s '^n' 'tn^M'

#  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
source ~/.zplug/init.zsh

zplug "unixorn/fzf-zsh-plugin"
zplug "mdumitru/fancy-ctrl-z"
zplug "davidde/git"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zpm-zsh/tmux"
zplug "jeffreytse/zsh-vi-mode"

if [[ "$(hostname)" == "mbp.local" ]]; then
    zplug "joow/macos"
fi

TMUX_AUTOSTART=false
TMUX_MOTD=true

export KEYTIMEOUT=1

zplug load

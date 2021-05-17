export EDITOR=nvim
export BROWSER=firefox
export GIT_PAGER=delta

export PATH="$PATH:\
${HOME}/.local/bin:\
${HOME}/.cargo/bin:"

export NVIM_PREFIX=$HOME/.config/nvim

if [[ "$(hostname)" == "mbp.local" ]]; then
    export PATH="$PATH:\
    /usr/local/Cellar/neovim/0.4.4_2/bin:\
    /usr/local/opt/openjdk/bin"

    if [ -e /Users/trevor/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/trevor/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
fi

if [[ -n ~/.bw ]]; then
    source ~/.bw
fi

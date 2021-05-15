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
fi

if [[ -n ~/.bw ]]; then
    source ~/.bw
fi

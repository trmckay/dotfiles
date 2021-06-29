export EDITOR=nvim
export BROWSER=firefox
export GIT_PAGER=delta

export TERM=xterm-256color

export PATH="$PATH:\
${HOME}/.local/bin:\
${HOME}/.cargo/bin:\
${HOME}/.local/opt/riscv/rv32i/bin:\
${HOME}/.local/opt/riscv/rv64gc/bin"

export NVIM_PREFIX=$HOME/.config/nvim

if [[ -n ~/.bw ]]; then
    source ~/.bw
fi

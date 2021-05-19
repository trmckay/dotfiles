if [ "$(hostname)" == "mbp.local" ]; then
    if [ -e /Users/trevor/.nix-profile/etc/profile.d/nix.sh ];
        then . /Users/trevor/.nix-profile/etc/profile.d/nix.sh;
    fi # added by Nix installer
fi

. "$HOME/.cargo/env"

#!/bin/bash


git clone https://github.com/ryanoasis/nerd-fonts || echo "Already cloned."
cd nerd-fonts
./install.sh Hack FiraCode Inconsolata Terminus
cd ..
rm -rf nerd-fonts

set +e

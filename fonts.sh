#!/bin/bash

set -e

git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh meslo hack fira-code inconsolata terminus
cd ..
rm -rf nerd-fonts

set +e

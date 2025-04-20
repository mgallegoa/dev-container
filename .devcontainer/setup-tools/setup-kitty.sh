#!/usr/bin/env bash

##########################
# NOTE: GUI apps like Kitty won’t run inside the container unless you're forwarding X11 (not common in VS Code DevContainers).
##########################

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

declare -x PATH_DOTFILES="$HOME/dotfiles"

echo "*** KITTY : Installing Kitty terminal..." | tee -a $HOME/setup.log
# Download latest Kitty AppImage and install
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh

# Add kitty to PATH (optional but recommended)
mkdir -p $HOME/.local/bin
ln -sf $HOME/.local/kitty.app/bin/kitty $HOME/.local/bin/
ln -sf $HOME/.local/kitty.app/bin/kitten $HOME/.local/bin/

echo "KITTY : Creating simlink to config dot file." | tee -a $HOME/setup.log
ln -sf $PATH_DOTFILES/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sf $PATH_DOTFILES/.config/kitty/current-theme.conf $HOME/.config/kitty/current-theme.conf

echo "*** KITTY : Kitty installed! Launch it with: ~/.local/bin/kitty , finished." | tee -a $HOME/setup.log

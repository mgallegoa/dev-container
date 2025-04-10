#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

# FONT_NAME="MesloLGS"
FONT_NAME="Meslo"
FONT_VARIANT="Nerd Font Mono"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FONT_NAME.tar.xz"
declare -x INSTALL_DIR="$HOME/.local/share/fonts"

mkdir -p "$INSTALL_DIR"

echo "*** NERD-FONTS : Downloading $FONT_NAME..." | tee -a $HOME/setup.log
curl -fLo "$HOME/$FONT_NAME.tar.xz" $FONT_URL

# Unzip to font directory
echo "NERD-FONTS : Installing $FONT_NAME $FONT_VARIANT to $INSTALL_DIR" | tee -a $HOME/setup.log
tar -xf "$HOME/$FONT_NAME.tar.xz" -C $INSTALL_DIR

# Clean up
rm "$HOME/$FONT_NAME.tar.xz"

# Refresh font cache
echo "NERD-FONTS : Refreshing font cache..." | tee -a $HOME/setup.log
fc-cache -fv $INSTALL_DIR

echo "*** NERD-FONTS : $FONT_NAME $FONT_VARIANT installed!." | tee -a $HOME/setup.log

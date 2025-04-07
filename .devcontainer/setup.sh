#!/bin/bash

# -e: Exit script on any error. -u: Treat unset variables as error. -o: Fail
set -euo pipefail

declare -x PATH_DOTFILES="$HOME/dotfiles"
declare -x PATH_DEVCONTAINER_SCRIPT="$PATH_DOTFILES/devContainer"
declare -x PATH_INSTALL_OPT="/opt/manuel"

echo "DEVCONTAINER_SCRIPT : Change to Home directory: $HOME" | tee -a $HOME/setup.log
cd $HOME

echo "DEVCONTAINER_SCRIPT : Cloning dot files repository in $HOME, and go to devContainer directory." | tee -a $HOME/setup.log
git clone https://github.com/mgallegoa/dotfiles.git && cd $PATH_DEVCONTAINER_SCRIPT

################### BASH
echo "DEVCONTAINER_SCRIPT - Bash: Create simlink to .bashrc." | tee -a $HOME/setup.log
ln -sf $PATH_DOTFILES/.bashrc $HOME/.bashrc

################### NERD FONTS
echo "DEVCONTAINER_SCRIPT - NerdFonts: Making file executable." | tee -a $HOME/setup.log
chmod +x $PATH_DEVCONTAINER_SCRIPT/setup-nerdFonts.sh
echo "DEVCONTAINER_SCRIPT - NerdFonts: Call file for NerdFonts configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-nerdFonts.sh
if [ $? -ne 0 ]; then
  echo "DEVCONTAINER_SCRIPT - NerdFonts: Error: setup-nerdFonts.sh failed!" | tee -a $HOME/setup.log
fi

################### OH MY POSH
curl -s https://ohmyposh.dev/install.sh | bash -s

################### KITTY
# NOTE: GUI apps like Kitty won’t run inside the container unless you're forwarding X11 (not common in VS Code DevContainers).
#
# echo "DEVCONTAINER_SCRIPT - KITTY: Making file executable." | tee -a $HOME/setup.log
# chmod +x $PATH_DEVCONTAINER_SCRIPT/setup-kitty.sh
# echo "DEVCONTAINER_SCRIPT - KITTY: Call file for KITTY configuration." | tee -a $HOME/setup.log
# $PATH_DEVCONTAINER_SCRIPT/setup-kitty.sh
# if [ $? -ne 0 ]; then
#   echo "DEVCONTAINER_SCRIPT - KITTY: Error: setup-kitty.sh failed!" | tee -a $HOME/setup.log
# fi

################## TMUX
echo "DEVCONTAINER_SCRIPT - TMUX: Making file executable." | tee -a $HOME/setup.log
chmod +x $PATH_DEVCONTAINER_SCRIPT/setup-tmux.sh
echo "DEVCONTAINER_SCRIPT - TMUX: Call file for tmux configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-tmux.sh
if [ $? -ne 0 ]; then
  echo "DEVCONTAINER_SCRIPT - TMUX: Error: setup-tmux.sh failed!" | tee -a $HOME/setup.log
fi

############# opt/manuel : Directory for software used for the user manuel
echo "DEVCONTAINER_SCRIPT : Directory for optional software user manuel: $PATH_INSTALL_OPT" | tee -a $HOME/setup.log
sudo mkdir $PATH_INSTALL_OPT
echo "DEVCONTAINER_SCRIPT : Assign chown to directory to user manuel: $PATH_INSTALL_OPT" | tee -a $HOME/setup.log
sudo chown -hR manuel:manuel $PATH_INSTALL_OPT

################## TMUXIFIER
echo "DEVCONTAINER_SCRIPT - TMUXIFIER: downloading the souurce code." | tee -a $HOME/setup.log
git clone https://github.com/jimeh/tmuxifier.git $PATH_INSTALL_OPT/tmuxifier


################## NVIM - version specifict
echo "DEVCONTAINER_SCRIPT - NVIM: downloading prebuild nvim (not source code)." | tee -a $HOME/setup.log
curl -Lo $PATH_INSTALL_OPT/nvim-linux64-v0.10.2.tar.gz https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
echo "DEVCONTAINER_SCRIPT - NVIM: Unzip in folder $PATH_INSTALL_OPT/nvim-linux64-v0.10.2" | tee -a $HOME/setup.log
tar -xzf $PATH_INSTALL_OPT/nvim-linux64-v0.10.2.tar.gz -C $PATH_INSTALL_OPT/
mv $PATH_INSTALL_OPT/nvim-linux64 $PATH_INSTALL_OPT/nvim-linux64-v0.10.2
rm $PATH_INSTALL_OPT/nvim-linux64-v0.10.2.tar.gz


echo "DEVCONTAINER_SCRIPT : Finished." | tee -a $HOME/setup.log

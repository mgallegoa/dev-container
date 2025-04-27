#!/usr/bin/env bash

# -e: Exit script on any error. -u: Treat unset variables as error. -o: Fail
set -euo pipefail

export PATH_DOTFILES="$HOME/dotfiles"
export PATH_DEVCONTAINER_SCRIPT="$HOME/setup-tools"
export PATH_INSTALL_OPT="/opt/manuel"
export NODE_VERSION="22.1.0"
export NVIM_VERSION="v0.10.2"
export JAVA_VERSION="21.0.6-tem"
export PATH_WORKSPACE="$HOME/mgallegoa"
export CHAFA_VERSION="chafa-1.14.5-1-x86_64-linux-gnu"

echo "** TOOLS-MANUEL: Making all files executable in folder $PATH_DEVCONTAINER_SCRIPT." | tee -a $HOME/setup.log

############# opt/manuel : Directory for software used for the user manuel
echo "TOOLS-MANUEL : Directory for optional software user manuel: $PATH_INSTALL_OPT, and $PATH_WORKSPACE" | tee -a $HOME/setup.log
sudo mkdir -p $PATH_INSTALL_OPT
mkdir -p $PATH_WORKSPACE
echo "TOOLS-MANUEL : Assign chown to directory to user manuel: $PATH_INSTALL_OPT" | tee -a $HOME/setup.log
sudo chown -hR manuel:manuel $PATH_INSTALL_OPT
# find $PATH_DEVCONTAINER_SCRIPT -type f -exec chmod +x {} \;

################### LOCALES
echo "TOOLS-MANUEL - locales: Generating locales for en_US.UTF-8." | tee -a $HOME/setup.log
sudo sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sudo locale-gen

################### BASH
echo "TOOLS-MANUEL - Bash: Create simlink to .bashrc." | tee -a $HOME/setup.log
ln -sf $PATH_DOTFILES/.bashrc $HOME/.bashrc
ln -sf $PATH_DOTFILES/.bash_aliases $HOME/.bash_aliases

################### NERD FONTS
echo "TOOLS-MANUEL - NerdFonts: Call file for NerdFonts configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-nerdFonts.sh
if [ $? -ne 0 ]; then
  echo "TOOLS-MANUEL - NerdFonts: Error: setup-nerdFonts.sh failed!" | tee -a $HOME/setup.log
fi

################### OH MY POSH
echo "TOOLS-MANUEL - OH MY POSH: Installing." | tee -a $HOME/setup.log
curl -s https://ohmyposh.dev/install.sh | bash -s
mkdir -p '$HOME/.cache/oh-my-posh/themes'
curl -Lo '$HOME/.cache/oh-my-posh/themes/night-owl.omp.json' 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/night-owl.omp.json' 

################### KITTY
# NOTE: GUI apps like Kitty won’t run inside the container unless you're forwarding X11 (not common in VS Code DevContainers).
#
# echo "TOOLS-MANUEL - KITTY: Making file executable." | tee -a $HOME/setup.log
# chmod +x $PATH_DEVCONTAINER_SCRIPT/setup-kitty.sh
# echo "TOOLS-MANUEL - KITTY: Call file for KITTY configuration." | tee -a $HOME/setup.log
# $PATH_DEVCONTAINER_SCRIPT/setup-kitty.sh
# if [ $? -ne 0 ]; then
#   echo "TOOLS-MANUEL - KITTY: Error: setup-kitty.sh failed!" | tee -a $HOME/setup.log
# fi

################## TMUX
echo "TOOLS-MANUEL - TMUX: Call file for tmux configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-tmux.sh
if [ $? -ne 0 ]; then
  echo "TOOLS-MANUEL - TMUX: Error: setup-tmux.sh failed!" | tee -a $HOME/setup.log
fi

################## NODE - NVM (Node Version Manager) - NPM
echo "TOOLS-MANUEL - NODE (NVM): Call file for Node configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-node.sh
if [ $? -ne 0 ]; then
  echo "TOOLS-MANUEL - NODE (NVM): Error: setup-node.sh failed!" | tee -a $HOME/setup.log
fi

################## JAVA - SDKMan
echo "TOOLS-MANUEL - JAVA (SDKMan): Call file for Java configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-java.sh
if [ $? -ne 0 ]; then
  echo "TOOLS-MANUEL - JAVA (SDKMan): Error: setup-java.sh failed!" | tee -a $HOME/setup.log
fi


################## TMUXIFIER
echo "TOOLS-MANUEL - TMUXIFIER: Call file for tmuxifier configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-tmuxifier.sh
if [ $? -ne 0 ]; then
  echo "TOOLS-MANUEL - TMUXIFIER: Error: setup-tmuxifier.sh failed!" | tee -a $HOME/setup.log
fi


################## NVIM - version specifict
echo "TOOLS-MANUEL - NVIM: Call file for NeoVim configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-nvim.sh
if [ $? -ne 0 ]; then
  echo "TOOLS-MANUEL - NVIM: Error: setup-nvim.sh failed!" | tee -a $HOME/setup.log
fi

################## CHAFA - version specifict
echo "TOOLS-MANUEL - CHAFA: Install chafa to show images in console ANSI standard." | tee -a $HOME/setup.log
curl -Lo $PATH_INSTALL_OPT/${CHAFA_VERSION}.tar.gz https://hpjansson.org/chafa/releases/static/${CHAFA_VERSION}.tar.gz
tar -xzf $PATH_INSTALL_OPT/${CHAFA_VERSION}.tar.gz -C $PATH_INSTALL_OPT/
rm -rf $PATH_INSTALL_OPT/${CHAFA_VERSION}.tar.gz

echo "** TOOLS-MANUEL : Finished." | tee -a $HOME/setup.log

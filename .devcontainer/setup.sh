#!/bin/bash

declare -x PATH_DEVCONTAINER="$HOME/dotfiles/devContainer"

echo "DEVCONTAINER : Change to Home directory: $HOME" | tee -a $HOME/setup.log
cd $HOME

echo "DEVCONTAINER : Cloning dot files repository in $HOME, and go to devContainer directory." | tee -a $HOME/setup.log

git clone https://github.com/mgallegoa/dotfiles.git && cd $PATH_DEVCONTAINER


echo "DEVCONTAINER : Starting personal configuration for Tmux..." | tee -a $HOME/setup.log

echo "DEVCONTAINER - TMUX: Making file executable." | tee -a $HOME/setup.log
chmod +x $PATH_DEVCONTAINER/setup-tmux.sh
echo "DEVCONTAINER - TMUX: Call file for tmux configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER/setup-tmux.sh

if [ $? -ne 0 ]; then
  echo "DEVCONTAINER - TMUX : Error: setup-tmux.sh failed!" | tee -a $HOME/setup.log

fi

echo "DEVCONTAINER : Finished." | tee -a $HOME/setup.log

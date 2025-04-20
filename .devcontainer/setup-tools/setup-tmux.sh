#!/usr/bin/env bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

if command -v tmux &> /dev/null; then
  echo "*** TMUX : The program is instaled." | tee -a $HOME/setup.log
else
  echo "*** TMUX : Cloning to folder $PATH_INSTALL_OPT/tmux-v3.4" | tee -a $HOME/setup.log
  git clone https://github.com/tmux/tmux.git $PATH_INSTALL_OPT/tmux-v3.4
  cd $PATH_INSTALL_OPT/tmux-v3.4
  git checkout -q 3.4
  echo "TMUX : running the autogen.sh in folder $PATH_INSTALL_OPT/tmux-v3.4" | tee -a $HOME/setup.log
  sh autogen.sh
  ./configure  --prefix=$PATH_INSTALL_OPT/tmux-v3.4 
  make && make install
fi

echo "TMUX : Creating simlink to config dot file." | tee -a $HOME/setup.log
ln -sf $PATH_DOTFILES/.tmux.conf $HOME/.tmux.conf

echo "TMUX : Cloning the tmux plugin manager." | tee -a $HOME/setup.log
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "TMUX : Install plugins." | tee -a $HOME/setup.log
sudo ln -s $PATH_INSTALL_OPT/tmux-v3.4/bin/tmux /usr/bin/
$HOME/.tmux/plugins/tpm/bin/install_plugins

echo "*** TMUX : Custom configuration finished." | tee -a $HOME/setup.log

#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail


echo "*** TMUXIFIER : Cloning tmuxifier program." | tee -a $HOME/setup.log
git clone https://github.com/jimeh/tmuxifier.git $PATH_INSTALL_OPT/tmuxifier
echo "TMUXIFIER : Creating simlink to .tmux-layouts." | tee -a $HOME/setup.log
ln -sf $PATH_DOTFILES/.tmux-layouts $HOME/

echo "*** TMUXIFIER : Custom configuration finished." | tee -a $HOME/setup.log

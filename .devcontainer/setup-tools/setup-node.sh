#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

echo "*** NVM : Node Version Manager, downloading source code in $PATH_INSTALL_OPT." | tee -a $HOME/setup.log
git clone https://github.com/nvm-sh/nvm.git $PATH_INSTALL_OPT/nvm-v0.39.7
cd $PATH_INSTALL_OPT/nvm-v0.39.7
git checkout v0.39.7

echo "*** NODE : Installing Node v$NODE_VERSION usin the NVM." | tee -a $HOME/setup.log
export NVM_DIR="$PATH_INSTALL_OPT/nvm-v0.39.7" \
    && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
    && nvm install $NODE_VERSION

echo "*** NVM : Custom configuration finished." | tee -a $HOME/setup.log

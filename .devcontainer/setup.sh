#!/bin/bash

# -e: Exit script on any error. -u: Treat unset variables as error. -o: Fail
set -euo pipefail

declare -x PATH_DEVCONTAINER_SCRIPT="$HOME/setup-tools"

echo "* DEVCONTAINER_SCRIPT : Cloning dot files repository in $HOME, and go to devContainer directory." | tee -a $HOME/setup.log
cd $HOME
git clone https://github.com/mgallegoa/dotfiles.git

################## TOOLS MANUEL
#echo "DEVCONTAINER_SCRIPT - TOOLS-MANUEL: Making all files executable in folder $PATH_DEVCONTAINER_SCRIPT." | tee -a $HOME/setup.log
#find $PATH_DEVCONTAINER_SCRIPT -type f -exec chmod +x {} \;
echo "DEVCONTAINER_SCRIPT - TOOLS-MANUEL: Call file for configuration tools Manuel." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-tools-manuel.sh
if [ $? -ne 0 ]; then
  echo "DEVCONTAINER_SCRIPT - TOOLS-MANUEL: Error: setup-tools-manuel.sh failed!" | tee -a $HOME/setup.log
fi

echo "* DEVCONTAINER_SCRIPT : Finished." | tee -a $HOME/setup.log

#!/usr/bin/env bash

# -e: Exit script on any error. -u: Treat unset variables as error. -o: Fail
set -euo pipefail

CHAFA_VERSION="chafa-1.14.5-1-x86_64-linux-gnu"
PATH_INSTALL_OPT="/opt/manuel"

# Additional software used for development, run this script after start the container
echo "ADDITIONAL: Install the bash-completion in the container." | tee -a $HOME/setup.log
sudo apt update && sudo apt install bash-completion
sudo apt update && sudo apt install command-not-found

echo "ADDITIONAL: Install chafa to show images in console ANSI standard." | tee -a $HOME/setup.log
cd $PATH_INSTALL_OPT
curl -Lo "$CHAFA_VERSION.tar.gz" https://hpjansson.org/chafa/releases/static/$CHAFA_VERSION.tar.gz
tar -xzf "$CHAFA_VERSION.tar.gz"
rm -rf "$CHAFA_VERSION.tar.gz"

echo "ADDITIONAL: Install java version 21.0.6-tem." | tee -a $HOME/setup.log
sdk install java 21.0.6-tem

echo "ADDITIONAL:: Finished." | tee -a $HOME/setup.log

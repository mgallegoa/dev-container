#!/usr/bin/env bash

# -e: Exit script on any error. -u: Treat unset variables as error. -o: Fail
set -euo pipefail

# Additional software used for develop, run this script after start the container
echo "ADDITIONAL: Install the bash-completion in the container." | tee -a $HOME/setup.log
sudo apt install bash-completion

echo "ADDITIONAL:: Finished." | tee -a $HOME/setup.log

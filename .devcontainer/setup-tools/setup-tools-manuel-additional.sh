#!/usr/bin/env bash

# -e: Exit script on any error. -u: Treat unset variables as error. -o: Fail
set -euo pipefail

echo "ADDITIONAL: Install java version 21.0.6-tem." | tee -a $HOME/setup.log
sdk install java 21.0.6-tem

echo "ADDITIONAL:: Finished." | tee -a $HOME/setup.log

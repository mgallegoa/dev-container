#!/usr/bin/env bash


# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

export SDKMAN_DIR="$PATH_INSTALL_OPT/sdkman"

echo "*** JAVA : SDKMan, downloading installer in $SDKMAN_DIR." | tee -a $HOME/setup.log
curl -s "https://get.sdkman.io" | bash

# echo "JAVA : SDKMan, source to $SDKMAN_DIR." | tee -a $HOME/setup.log
# [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
#
# echo "JAVA : SDKMan, Installing Java version $JAVA_VERSION usin the SDKMan." | tee -a $HOME/setup.log
# $SDKMAN_DIR sdk install java $JAVA_VERSION

echo "*** JAVA : SDKMan, Custom configuration finished." | tee -a $HOME/setup.log

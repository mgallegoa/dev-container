#!/usr/bin/env bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

echo "*** NVIM: downloading prebuild nvim (not source code)." | tee -a $HOME/setup.log
curl -Lo "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION.tar.gz" https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.tar.gz
echo "NVIM: Unzip in folder $PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION" | tee -a $HOME/setup.log
tar -xzf "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION.tar.gz" -C $PATH_INSTALL_OPT/
mv $PATH_INSTALL_OPT/nvim-linux64 "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION"
rm "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION.tar.gz"
echo "NVIM: Creating simlink to config dot files" | tee -a $HOME/setup.log
mkdir -p "$HOME/.config"
ln -sf $PATH_DOTFILES/.config/nvim $HOME/.config/
sudo ln -s "$PATH_DOTFILES/nvim-linux64-$NVIM_VERSION/bin/nvim" /usr/bin/

echo "NVIM: Run nvim in headless mode to sync Lazy." | tee -a $HOME/setup.log
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless "+Lazy! sync" +qa

echo "NVIM: Call file for NeoVim LSP Language Server Protocol, DAP, Linters, Formaters configuration." | tee -a $HOME/setup.log
$PATH_DEVCONTAINER_SCRIPT/setup-nvim-lsp.sh
if [ $? -ne 0 ]; then
  echo "NVIM: Error: setup-nvim-lsp.sh failed!" | tee -a $HOME/setup.log
fi



echo "*** NVIM : Custom configuration finished." | tee -a $HOME/setup.log

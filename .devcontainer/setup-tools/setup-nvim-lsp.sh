#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

export PATH="$PATH:$PATH_INSTALL_OPT/nvm-v0.39.7/versions/node/v$NODE_VERSION/bin"
echo "*** NVIM-LSP-DAP-LINTERS-FORMATERS: Install LSP using $PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim." | tee -a $HOME/setup.log

echo "NVIM-LSP: Install LSP with Mason Api. lua-language-server, vscode-css-languageservice, vscode-html-languageservice, typescript-language-server, eclipse.jdt.ls." | tee -a $HOME/setup.log
# "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"lua require('mason').setup()" \
#      +"lua require('mason-lspconfig').setup({ ensure_installed = { 'lua_ls', 'cssls',  'html', 'ts_ls', 'jdtls' }, automatic_installation = true })" \
#      +qa

"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall lua-language-server" +q > /dev/null
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall css-lsp" +q > /dev/null
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall html-lsp" +q > /dev/null
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall typescript-language-server" +q > /dev/null
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall jdtls" +q > /dev/null

echo "NVIM-DAP: Install DAP with Mason Api. bash, js-debug-adapter, java-debug-adapter, java-test." | tee -a $HOME/setup.log
# "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"lua require('mason').setup()" \
#      +"lua require('mason-lspconfig').setup({ ensure_installed = { 'bash', js', 'java-debug-adapter', 'java-test' }, automatic_installation = true })" \
#      +qa

"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall bash-debug-adapter" +q > /dev/null
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall js-debug-adapter" +q > /dev/null
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall java-debug-adapter" +q > /dev/null
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall java-test" +q  > /dev/null


echo "NVIM-LINTER: Install LINTER with Mason Api. eslint_d, htmlhint." | tee -a $HOME/setup.log
# "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"lua require('mason').setup()" \
#      +"lua require('mason-lspconfig').setup({ ensure_installed = { 'eslint_d', 'htmlhint' }, automatic_installation = true })" \
#      +qa

"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall eslint_d" +q > /dev/null
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall htmlhint" +q > /dev/null

echo "NVIM-FORMATERs: Install Formatters with Mason Api. prettierd, stylua." | tee -a $HOME/setup.log
# "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"lua require('mason').setup()" \
#      +"lua require('mason-lspconfig').setup({ ensure_installed = { 'prettierd', 'stylua' }, automatic_installation = true })" \
#      +qa

"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall prettierd" +q > /dev/null
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"MasonInstall stylua" +q > /dev/null

echo "*** NVIM-LSP : Custom configuration finished." | tee -a $HOME/setup.log

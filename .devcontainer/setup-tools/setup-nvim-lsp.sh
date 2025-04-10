#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

echo "*** NVIM-LSP: Install LSP using $PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim." | tee -a $HOME/setup.log
echo "NVIM-LSP: Install LSP with Mason Api. vscode-css-languageservice." | tee -a $HOME/setup.log
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"lua require('mason').setup()" \
     +"lua require('mason-lspconfig').setup()" \
     +"lua require('mason-lspconfig').install({ 'cssls' })" +qa


echo "NVIM-LSP: Install LSP with Mason Api. eslint_d, vscode-html-languageservice, htmlhint." | tee -a $HOME/setup.log
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless -c 'lua require("mason-registry").refresh()' \
                -c 'lua require("mason-registry").get("eslint_d"):install()' \
                -c 'lua require("mason-registry").get("vscode-html-languageservice"):install()' \
                -c 'lua require("mason-registry").get("htmlhint"):install()' \
                -c 'q'

echo "NVIM-LSP: Install LSP with Mason Api. js-debug-adapter, lua-language-server, prettierd, stylua." | tee -a $HOME/setup.log
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless -c 'lua require("mason-registry").refresh()' \
                -c 'lua require("mason-registry").get("js-debug-adapter"):install()' \
                -c 'lua require("mason-registry").get("lua-language-server"):install()' \
                -c 'lua require("mason-registry").get("prettierd"):install()' \
                -c 'lua require("mason-registry").get("stylua"):install()' \
                -c 'lua require("mason-registry").get("typescript-language-server"):install()' \
                -c 'q'

echo "NVIM-LSP: Install LSP with Mason Api. eclipse.jdt.ls, ." | tee -a $HOME/setup.log
"$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless +"lua require('mason').setup()" \
     +"lua require('mason-lspconfig').setup()" \
     +"lua require('mason-lspconfig').install({ 'eclipse.jdt.ls' })" +qa


echo "*** NVIM-LSP : Custom configuration finished." | tee -a $HOME/setup.log

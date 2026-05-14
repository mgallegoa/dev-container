#!/usr/bin/env bash


# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

echo "*** TERRAFORM : Download and Install the HashiCorp GPG Key." | tee -a $HOME/setup.log
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg | bash

# Add the Official HashiCorp Repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update apt-get and Install Terraform
sudo apt-get update && sudo apt-get install terraform

echo "*** TERRAFORM : Install terraform, Custom configuration finished." | tee -a $HOME/setup.log

#!/usr/bin/env bash

source ./utils.sh

#################################
#   starting install scripts    #
#################################
echo "starting install script"
echo "the script will require you to use sudo to install things"
echo "..."

# checks if the user is in sudo so that we can tell the user they should not be root for this script

ROOT=is_user_root

if ($ROOT == true)
    then
    echoerr "dont run this script in root"
    exit
fi

echo "your not running in root we can continue"

###################################
#    update and upgrade system    #
###################################
sudo apt upgrade && sudo apt update
#################################
#    installing vim and nvim    #
#################################
echo "installnig editor"
sudo apt install neovim vim

###########################
#    installing docker    #
###########################

# set os specific variables
. /etc/os-release

# installs things i need to install docker
sudo apt install --no-insall-recommends apt-transport-https ca-certificates curl gnupg2t

curl -fsSL https://download.docker.com/linux/${ID}/gpg | sudo tee /etc/apt/trusted.gpg.d/docker.asc

echo "deb [arch=amd64] https://download.docker.com/linux/${ID} ${VERSION_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/docker.list

# updates the docker list thing
sudo apt update && sudo apt upgrade

# installs all the docker stuff
sudo apt install docker-ce docker-ce-cli containerd.io
################################
#    installing shell tools    #
################################
echo "installing shell tools"
sudo apt install grep fzf btop stow jq nnn ripgrep 

#####################################
#    install lazy git and docker    #
#####################################
sudo bash ./lazydocker.sh
sudo bash ./lazygit.sh

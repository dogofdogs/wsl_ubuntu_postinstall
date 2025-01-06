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

echo "deb [arch=amd64] htps://download.docker.com/linux/${ID} ${VERSION_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/docker.list
#
sudo apt update && sudo apt upgrade

#installs all the docker stuff
sudo apt-get install dockr-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugine

################################
#    installing shell tools    #
################################
echo "installing shell tools"
sudo apt install grep fzf btop stow jq nnn ripgrep 


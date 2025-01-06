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

#!/usr/bin/env bash

# gets the latest verion of lazy git for later execution
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
# unpack lazy git
tar xf lazygit.tar.gz lazygit
# install lazy git
sudo install lazygit -D -t /bin
# deletes the lazy git
rm -rf lazygit lazygit.tar.gz

#!/usr/bin/env bash
cd ~
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
#export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source $HOME/.nvm/nvm.sh;
nvm install 6.10.2
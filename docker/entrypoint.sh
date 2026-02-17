#!/usr/bin/env bash

set -e

if [ -e '~/.initialized' ]; then
   exit 0 
fi

cd ~/dotfiles
echo 'includes = []' > ~/dotfiles/.dotter/local.toml
echo 'packages = ["default"]' >> ~/dotfiles/.dotter/local.toml
~/.local/bin/dotter deploy --force

touch ~/.initialized

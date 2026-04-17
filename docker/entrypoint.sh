#!/usr/bin/env bash

set -e

if [ -e '~/.initialized' ]; then
   exit 0
fi

echo 'includes = [".dotter/unix.toml"]' > ~/dotfiles/.dotter/local.toml
echo 'packages = ["default", "unix"]' >> ~/dotfiles/.dotter/local.toml
cd ~/dotfiles && ~/.local/bin/dotter deploy --force

touch ~/.initialized

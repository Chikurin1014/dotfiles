#!/usr/bin/env bash

set -e

if [ -e "$HOME/.initialized" ]; then
   exit 0
fi

"$HOME/dotfiles/deploy.sh"

touch "$HOME/.initialized"

eval $(mise activate bash)
exec fish -l
